################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="cxxtools"
PKG_VERSION="2.2.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL-2"
PKG_SITE="http://www.tntnet.org/cxxtools.html"
PKG_URL="http://www.tntnet.org/download/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="cxxtools: a collection of general-purpose C++ classes"
PKG_LONGDESC="Cxxtools is a collection of general-purpose C++ classes"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_HOST="--disable-demos --with-atomictype=pthread --disable-unittest"
PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --disable-demos --with-atomictype=pthread --disable-unittest"

pre_configure_target() {
  CFLAGS="$CFLAGS -fPIC"
  CXXFLAGS="$CXXFLAGS -fPIC"
  LDFLAGS="$LDFLAGS -fPIC"
}


post_makeinstall_host() {
  rm -rf $TOOLCHAIN/bin/cxxtools-config
}

post_makeinstall_target() {
  $SED "s:\(['= ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" $SYSROOT_PREFIX/usr/bin/cxxtools-config

  rm -rf $INSTALL/usr/bin
}
