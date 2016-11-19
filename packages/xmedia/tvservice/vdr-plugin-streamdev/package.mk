################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-streamdev"
PKG_VERSION="674bb5b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/show/plg-streamdev"
PKG_URL="https://projects.vdr-developer.org/git/$PKG_NAME.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr libressl"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="TV"
PKG_LONGDESC="TV"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
       LIBDIR="." \
       LOCDIR="./locale"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/vdr
    cp client/libvdr-streamdev*.so.* $INSTALL/usr/lib/vdr
    cp server/libvdr-streamdev*.so.* $INSTALL/usr/lib/vdr

  mkdir -p $INSTALL/usr/config/vdr/plugins/streamdev-server
    cp streamdev-server/* $INSTALL/usr/config/vdr/plugins/streamdev-server
    echo '0.0.0.0/0' >> $INSTALL/usr/config/vdr/plugins/streamdev-server/streamdevhosts.conf

  mkdir -p $INSTALL/usr/share
    cp -a server/locale $INSTALL/usr/share
    cp -a client/locale $INSTALL/usr/share
}
