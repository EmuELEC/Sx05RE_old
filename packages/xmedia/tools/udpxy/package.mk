################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="udpxy"
PKG_VERSION="1.0.23-0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.udpxy.com/download-en.html"
PKG_URL="$SOURCEFORGE_SRC/project/udpxy/udpxy/Chipmunk-1.0/${PKG_NAME}.${PKG_VERSION}-prod.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="udpxy is a UDP-to-HTTP multicast traffic relay daemon"
PKG_LONGDESC="udpxy is a UDP-to-HTTP multicast traffic relay daemon."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  # fails to build with gcc 4.9 + lto
  strip_lto
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp -P udpxy $INSTALL/usr/bin
    cp -P udpxrec $INSTALL/usr/bin
  cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin
}

post_install() {
  enable_service udpxy.service
}
