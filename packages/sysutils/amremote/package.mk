################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="amremote"
PKG_VERSION="6431040"
PKG_REV="1"
PKG_ARCH="arm aarch64"
PKG_LICENSE="other"
PKG_SITE="http://www.amlogic.com"
PKG_URL="https://github.com/codesnake/amremote/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain usbutils"
PKG_SECTION="sysutils/remote"
PKG_SHORTDESC="amremote - IR remote configuration utility for Amlogic-based devices"
PKG_LONGDESC="amremote - IR remote configuration utility for Amlogic-based devices"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp remotecfg $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/amremote
    cp $PKG_DIR/config/keylayout.sample $INSTALL/usr/config/amremote
}
