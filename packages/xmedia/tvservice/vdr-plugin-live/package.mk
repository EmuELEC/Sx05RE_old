################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-live"
PKG_VERSION="869ac69"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://live.vdr-developer.org/en/index.php"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain vdr tntnet pcre:host pcre"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="vdr-live: the LIVE Interactive VDR Environment/"
PKG_LONGDESC="vdr-live allows a comfortable operation of VDR and some of its plugins trough a web interface"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : not
}

makeinstall_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
       LIBDIR="/usr/lib/vdr" \
       DESTDIR="$INSTALL" \
       install

  mkdir -p $INSTALL/usr/config/vdr/plugins
    cp -a live $INSTALL/usr/config/vdr/plugins
}
