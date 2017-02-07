#!/bin/sh


rm -r /var/lock/start.kodi
touch /var/lock/start.retrom
systemctl start retroarchm.service


