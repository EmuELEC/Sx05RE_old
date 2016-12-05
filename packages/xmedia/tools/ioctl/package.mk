################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="ioctl"
PKG_VERSION="3a55d73"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/jerome-pouiller/ioctl"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="The missing tool to call arbitrary ioctl on devices"
PKG_LONGDESC="The missing tool to call arbitrary ioctl on devices."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  CC=$CC CFLAGS=$CFLAGS make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
   cp ioctl $INSTALL/usr/bin
}
