################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="rtmpdump"
PKG_VERSION="fa8646d"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://rtmpdump.mplayerhq.hu/"
PKG_URL="http://repo.or.cz/rtmpdump.git/snapshot/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib libressl"
PKG_SECTION="multimedia"
PKG_SHORTDESC="rtmpdump: a toolkit for RTMP streams."
PKG_LONGDESC="rtmpdump is a toolkit for RTMP streams. All forms of RTMP are supported, including rtmp://, rtmpt://, rtmpe://, rtmpte://, and rtmps://."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

MAKEFLAGS="-j1"

make_target() {
  make prefix=/usr \
       incdir=/usr/include/librtmp \
       libdir=/usr/lib \
       mandir=/usr/share/man \
       CC="$CC" \
       LD="$LD" \
       AR="$AR" \
       CRYPTO="OPENSSL" \
       OPT="" \
       XCFLAGS="$CFLAGS" \
       XLDFLAGS="$LDFLAGS" \
       XLIBS="-lm"
}

makeinstall_target() {
  make DESTDIR=$SYSROOT_PREFIX \
       prefix=/usr \
       incdir=/usr/include/librtmp \
       libdir=/usr/lib \
       mandir=/usr/share/man \
       CC="$CC" \
       LD="$LD" \
       AR="$AR" \
       CRYPTO="OPENSSL" \
       OPT="" \
       XCFLAGS="$CFLAGS" \
       XLDFLAGS="$LDFLAGS" \
       XLIBS="-lm" \
       install

  make DESTDIR=$INSTALL \
       prefix=/usr \
       incdir=/usr/include/librtmp \
       libdir=/usr/lib \
       mandir=/usr/share/man \
       CC="$CC" \
       LD="$LD" \
       AR="$AR" \
       CRYPTO="OPENSSL" \
       OPT="" \
       XCFLAGS="$CFLAGS" \
       XLDFLAGS="$LDFLAGS" \
       XLIBS="-lm" \
       install
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/sbin

  # to be removed: hack for "compatibility"
  mkdir -p $INSTALL/usr/lib
    ln -sf librtmp.so.1 $INSTALL/usr/lib/librtmp.so.0
}
