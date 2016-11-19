################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="tntnet"
PKG_VERSION="2.2.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL-2"
PKG_SITE="http://www.tntnet.org/"
PKG_URL="http://www.tntnet.org/download/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="cxxtools:host zlib:host"
PKG_DEPENDS_TARGET="toolchain tntnet:host libtool cxxtools"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="tntnet: C++ Dynamite for the Web"
PKG_LONGDESC="Tntnet is a modular, multithreaded, high performance webapplicationserver for C++"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_HOST="--disable-unittest \
                         --with-server=no \
                         --with-sdk=yes \
                         --with-demos=no \
                         --with-epoll=yes \
                         --with-ssl=no \
                         --with-stressjob=no"

PKG_CONFIGURE_OPTS_TARGET="--disable-unittest \
                           --with-sysroot=$SYSROOT_PREFIX \
                           --with-server=no \
                           --with-sdk=no \
                           --with-demos=no \
                           --with-epoll=yes \
                           --with-ssl=no \
                           --with-stressjob=no"

post_makeinstall_target() {
  $SED "s:\(['= ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" $SYSROOT_PREFIX/usr/bin/tntnet-config

  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/share
}
