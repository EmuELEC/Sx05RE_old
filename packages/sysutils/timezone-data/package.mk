################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="timezone-data"
PKG_VERSION="2016a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Public Domain"
PKG_SITE="http://www.iana.org/time-zones"
# this package actually contains both packages tzcode and tzdate in a single package
# duplicate files are the same files
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="system"
PKG_SHORTDESC="timezone-data"
PKG_LONGDESC="timezone-data"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  setup_toolchain host
  make CC="$HOST_CC" CFLAGS="$HOST_CFLAGS"
}

makeinstall_target() {
  make TOPDIR="./.install_pkg" install
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/share/zoneinfo
    mv $INSTALL/etc/zoneinfo/* $INSTALL/usr/share/zoneinfo

  rm -rf $INSTALL/man
  rm -rf $INSTALL/etc

  mkdir -p $INSTALL/etc
    ln -sf /var/run/localtime $INSTALL/etc/localtime
}

post_install() {
  enable_service tz-data.service
}
