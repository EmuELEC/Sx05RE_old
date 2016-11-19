################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="lirc"
PKG_VERSION="0.9.4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.lirc.org"
PKG_URL="$SOURCEFORGE_SRC/lirc/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libftdi1 libusb-compat libxslt"
PKG_SECTION="sysutils/remote"
PKG_SHORTDESC="lirc: Linux Infrared Remote Control"
PKG_LONGDESC="LIRC is a package that allows you to decode and send infra-red signals of many (but not all) commonly used remote controls."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_path_LIBUSB_CONFIG= /
                           ac_cv_func_forkpty=no \
                           ac_cv_lib_util_forkpty=no \
                           ac_cv_prog_HAVE_PYTHON3=no \
                           --localstatedir=/ \
                           --with-gnu-ld \
                           --without-x"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin/pronto2lirc
  rm -rf $INSTALL/usr/bin/lirc-setup
  rm -rf $INSTALL/usr/sbin/lircd-setup
  rm -rf $INSTALL/usr/lib/python3.4
  rm -rf $INSTALL/usr/lib/systemd
  rm -rf $INSTALL/lib
  rm -rf $INSTALL/usr/share
  rm -rf $INSTALL/etc

  mkdir -p $INSTALL/etc/lirc
    cp $PKG_DIR/config/lircd.conf.* $INSTALL/etc/lirc

  mkdir -p $INSTALL/usr/lib/alexelec
    cp $PKG_DIR/scripts/lircd_helper $INSTALL/usr/lib/alexelec

  mkdir -p $INSTALL/usr/lib/udev
    cp $PKG_DIR/scripts/lircd_wakeup_enable $INSTALL/usr/lib/udev
}
