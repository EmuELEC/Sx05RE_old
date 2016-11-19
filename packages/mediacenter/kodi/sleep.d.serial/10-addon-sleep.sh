#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

. /etc/profile

# see https://wiki.archlinux.org/index.php/Power_Management#Hooks_in_.2Fusr.2Flib.2Fsystemd.2Fsystem-sleep

for script in $HOME/.kodi/addons/*/sleep.d/*.power; do
  progress "running addon sleep script $script ($@)..."
  sh $script $@
done

exit 0