#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

SERVICE="vdr.service"
SERVICE_DIR="/storage/.cache/services"

case $1 in
  pre)
    if [ -f "$SERVICE_DIR/vdr.conf" ] ; then
      systemctl stop "$SERVICE"
      rm -f /var/lock/dvb-fw.load
    fi
    ;;
  post)
    if [ -f "$SERVICE_DIR/vdr.conf" ] ; then
      systemctl start "$SERVICE"
    fi
    ;;
esac
