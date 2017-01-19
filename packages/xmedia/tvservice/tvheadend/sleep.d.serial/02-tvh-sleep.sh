#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

SERVICE="tvheadend.service"
SERVICE_DIR="/storage/.cache/services"

case $1 in
  pre)
    if [ -f "$SERVICE_DIR/tvheadend.conf" ] ; then
      systemctl stop "$SERVICE"
    fi
    ;;
  post)
    if [ -f "$SERVICE_DIR/tvheadend.conf" ] ; then
      systemctl start "$SERVICE"
    fi
    ;;
esac
