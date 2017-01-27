################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="zlib"
PKG_VERSION="1.2.11"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.zlib.net"
PKG_URL="http://zlib.net/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DEPENDS_HOST=""
PKG_SECTION="compress"
PKG_SHORTDESC="zlib: A general purpose (ZIP) data compression library"
PKG_LONGDESC="zlib is a general purpose data compression library. All the code is thread safe. The data format used by the zlib library is described by RFCs (Request for Comments) 1950 to 1952 in the files ftp://ds.internic.net/rfc/rfc1950.txt (zlib format), rfc1951.txt (deflate format) and rfc1952.txt (gzip format)."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_configure_target() {
 ## configure minizip
 (
  cd $ROOT/$PKG_BUILD/contrib/minizip
  rm Makefile
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:../../"
  do_autoreconf
  cp $ROOT/$PKG_BUILD/.$TARGET_NAME/zconf.h ./
  ./configure --host=$TARGET_NAME --build=$HOST_NAME $TARGET_CONFIGURE_OPTS --disable-shared --enable-static
 )
}

post_make_target() {
 # make minizip
 make -C $ROOT/$PKG_BUILD/contrib/minizip
}

post_makeinstall_target() {
 # Install minizip
 make -C $ROOT/$PKG_BUILD/contrib/minizip DESTDIR=$SYSROOT_PREFIX install
}

