################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libdvbcsa"
PKG_VERSION="f988715"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.videolan.org/developers/libdvbcsa.html"
PKG_SITE="https://github.com/glenvt18/libdvbcsa/"
PKG_URL="https://github.com/glenvt18/libdvbcsa/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="libdvbcsa is a free implementation of the DVB Common Scrambling Algorithm - DVB/CSA - with encryption and decryption capabilities"
PKG_LONGDESC="libdvbcsa is a free implementation of the DVB Common Scrambling Algorithm - DVB/CSA - with encryption and decryption capabilities"
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static --with-sysroot=$SYSROOT_PREFIX --enable-neon"

pre_configure_target() {
# libdvbcsa is a bit faster without LTO, and tests will fail with gcc-5.x
  strip_lto

  export CFLAGS="$CFLAGS -fPIC"
}

