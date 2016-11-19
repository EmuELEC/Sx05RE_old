#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
[ -z "$BOOT_PART" ] && BOOT_PART=$(df "$BOOT_ROOT" | tail -1 | awk {' print $1 '})
if [ -z "$BOOT_DISK" ]; then
  case $BOOT_PART in
    /dev/sd[a-z][0-9]*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,[0-9]*,,g")
      ;;
    /dev/mmcblk*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,p[0-9]*,,g")
      ;;
  esac
fi

SYSTEM_TYPE=""

# mount $BOOT_ROOT r/w
  mount -o remount,rw $BOOT_ROOT

# update Device Tree Blobs
  for all_dtb in /flash/*.dtb; do
    dtb=$(basename $all_dtb)
    if [ -f $SYSTEM_ROOT/usr/share/bootloader/$dtb ]; then
      echo "*** updating Device Tree Blob: $dtb ..."
      cp -p $SYSTEM_ROOT/usr/share/bootloader/$dtb $BOOT_ROOT
    fi
  done

# update bootloader files
    if [ -n "$SYSTEM_TYPE" ]; then
      UBOOT_IMG_SRC=u-boot-$SYSTEM_TYPE.img
      SPL_SRC=SPL-$SYSTEM_TYPE
    else
      UBOOT_IMG_SRC=u-boot.img
      SPL_SRC=SPL
    fi

    if [ -f $SYSTEM_ROOT/usr/share/bootloader/$UBOOT_IMG_SRC ]; then
      echo "*** updating u-boot image: $BOOT_ROOT/u-boot.img ..."
      cp -p $SYSTEM_ROOT/usr/share/bootloader/$UBOOT_IMG_SRC $BOOT_ROOT/u-boot.img
    fi

    if [ -f $SYSTEM_ROOT/usr/share/bootloader/$SPL_SRC ]; then
      echo "*** updating u-boot SPL Blob on: $BOOT_DISK ..."
      dd if="$SYSTEM_ROOT/usr/share/bootloader/$SPL_SRC" of="$BOOT_DISK" bs=1k seek=1 conv=fsync &>/dev/null
    fi

  # prefer uEnv.txt over boot.scr
  if [ -n "$SYSTEM_TYPE" -a -f $SYSTEM_ROOT/usr/share/bootloader/uEnv-$SYSTEM_TYPE.txt -a ! -f $BOOT_ROOT/uEnv.txt ]; then
    cp -p $SYSTEM_ROOT/usr/share/bootloader/uEnv-$SYSTEM_TYPE.txt $BOOT_ROOT/uEnv.txt
  elif [ -f $SYSTEM_ROOT/usr/share/bootloader/uEnv.txt -a ! -f $BOOT_ROOT/uEnv.txt ]; then
    cp -p $SYSTEM_ROOT/usr/share/bootloader/uEnv.txt $BOOT_ROOT
  elif [ -f $SYSTEM_ROOT/usr/share/bootloader/boot.scr -a ! -f $BOOT_ROOT/boot.scr ]; then
    cp -p $SYSTEM_ROOT/usr/share/bootloader/boot.scr $BOOT_ROOT
  fi

# mount $BOOT_ROOT r/o
  sync
  mount -o remount,ro $BOOT_ROOT
