################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="aml-vnc"
PKG_VERSION="0.2"
PKG_REV="1"
PKG_ARCH="arm"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/kszaq/my-addons"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain libvncserver"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="VNC Server for Amlogic devices"
PKG_LONGDESC="VNC Server for Amlogic devices"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -P aml-vnc $INSTALL/usr/bin
  debug_strip $INSTALL/usr/bin
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/* $INSTALL/usr/bin
}

post_install() {
  enable_service aml-vnc.service
}
