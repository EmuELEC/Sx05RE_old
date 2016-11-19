################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-dvbapi"
PKG_VERSION="5de51c3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/manio/vdr-plugin-dvbapi"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain vdr libdvbcsa"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="TV"
PKG_LONGDESC="TV"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

pre_make_target() {
  # dont build parallel
  MAKEFLAGS=-j1
}

make_target() {
  : not
}

makeinstall_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
       LIBDVBCSA=1 \
       DESTDIR=$INSTALL \
       install
}
