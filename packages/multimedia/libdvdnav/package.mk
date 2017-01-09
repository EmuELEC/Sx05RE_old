################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libdvdnav"
PKG_VERSION="43b5f81"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/libdvdnav"
PKG_URL="https://github.com/xbmc/libdvdnav/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdvdread"
PKG_SECTION="multimedia"
PKG_SHORTDESC="libdvdnav: a library that allows easy use of sophisticated DVD navigation features such as DVD menus, multiangle playback and even interactive DVD games."
PKG_LONGDESC="libdvdnav is a library that allows easy use of sophisticated DVD navigation features such as DVD menus, multiangle playback and even interactive DVD games."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-pic"

pre_configure_target() {
  export CFLAGS="$CFLAGS -D_XBMC -DHAVE_DVDCSS_DVDCSS_H"
}

post_makeinstall_target() {
  ln -sf dvdnav.pc $SYSROOT_PREFIX/usr/lib/pkgconfig/libdvdnav.pc
}
