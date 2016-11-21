#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"

for arg in $(cat /proc/cmdline); do
  case $arg in
    boot=*)
      boot="${arg#*=}"
      case $boot in
        /dev/mmc*)
          $SYSTEM_ROOT/usr/sbin/fatlabel $boot "ALEXELEC"
          ;;
        LABEL=*)
          $SYSTEM_ROOT/usr/sbin/fatlabel $($SYSTEM_ROOT/sbin/findfs $boot) "ALEXELEC"
          ;;
      esac
      ;;
    disk=*)
      disk="${arg#*=}"
      case $disk in
        /dev/mmc*)
          $SYSTEM_ROOT/sbin/e2label $disk "ALEXELEC_DISK"
          ;;
        LABEL=*)
          $SYSTEM_ROOT/sbin/e2label $($SYSTEM_ROOT/sbin/findfs $disk) "ALEXELEC_DISK"
          ;;
      esac
      ;;
  esac
done
