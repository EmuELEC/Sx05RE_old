#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
[ -z "$UPDATE_DIR" ] && UPDATE_DIR="/storage/.update"
UPDATE_DTB_IMG="$UPDATE_DIR/dtb.img"
UPDATE_DTB=`ls -1 "$UPDATE_DIR"/*.dtb 2>/dev/null | head -n 1`

# Indicate that we are not modifying bootloader
echo "Bootloader has NOT been modified."
echo "Updating device tree and partition labels..."

for arg in $(cat /proc/cmdline); do
  case $arg in
    boot=*)
      boot="${arg#*=}"
      case $boot in
        /dev/mmc*)
          LD_LIBRARY_PATH="$SYSTEM_ROOT/lib" $SYSTEM_ROOT/usr/sbin/fatlabel $boot "ALEXELEC"
          ;;
        LABEL=*)
          LD_LIBRARY_PATH="$SYSTEM_ROOT/lib" $SYSTEM_ROOT/usr/sbin/fatlabel $($SYSTEM_ROOT/sbin/findfs $boot) "ALEXELEC"
          ;;
      esac

      if [ -f "$UPDATE_DTB_IMG" ] ; then
        UPDATE_DTB_SOURCE="$UPDATE_DTB_IMG"
      elif [ -f "$UPDATE_DTB" ] ; then
        UPDATE_DTB_SOURCE="$UPDATE_DTB"
      fi

      if [ -f "$UPDATE_DTB_SOURCE" ] ; then
        echo "Updating device tree from $UPDATE_DTB_SOURCE..."
        LD_LIBRARY_PATH="$SYSTEM_ROOT/lib" $SYSTEM_ROOT/usr/sbin/fw_setenv upgrade_step 3 2>/dev/null
        case $boot in
          /dev/system)
            dd if=$UPDATE_DTB_SOURCE of="/dev/dtb" bs=256k
            ;;
          /dev/mmc*|LABEL=*)
            mount -o rw,remount $BOOT_ROOT
            cp -f $UPDATE_DTB_SOURCE "$BOOT_ROOT/dtb.img"
            ;;
        esac
        LD_LIBRARY_PATH="$SYSTEM_ROOT/lib" $SYSTEM_ROOT/usr/sbin/fw_setenv upgrade_step 2 2>/dev/null
      fi
      ;;
    disk=*)
      disk="${arg#*=}"
      case $disk in
        /dev/mmc*)
          LD_LIBRARY_PATH="$SYSTEM_ROOT/lib" $SYSTEM_ROOT/sbin/e2label $disk "ALEXELEC_DISK"
          ;;
        LABEL=*)
          LD_LIBRARY_PATH="$SYSTEM_ROOT/lib" $SYSTEM_ROOT/sbin/e2label $($SYSTEM_ROOT/sbin/findfs $disk) "ALEXELEC_DISK"
          ;;
      esac
      ;;
  esac
done
