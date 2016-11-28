################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="serviceref"
PKG_VERSION="0.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/pipelka/vdr-plugin-xvdr/tree/master/tools"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="service reference tool for VDR"
PKG_LONGDESC="service reference tool for VDR"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  CC=$CXX CFLAGS="" make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -P serviceref $INSTALL/usr/bin
  debug_strip $INSTALL/usr/bin
}
