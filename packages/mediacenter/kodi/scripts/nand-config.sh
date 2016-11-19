#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

rm -f /var/lock/nand.lock
cat /proc/cmdline | grep 'BOOT_IMAGE=kernel.img' > /dev/null

if [ $? == 0 ]; then
  mkdir -p /storage/nand
  touch /var/lock/nand.lock
fi

exit 0
