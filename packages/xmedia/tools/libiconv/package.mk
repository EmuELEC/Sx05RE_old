################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libiconv"
PKG_VERSION="1.14"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://savannah.gnu.org/projects/libiconv/"
PKG_URL="http://ftp.gnu.org/pub/gnu/libiconv/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="Libiconv converts from one character encoding to another through Unicode conversion."
PKG_LONGDESC="Libiconv converts from one character encoding to another through Unicode conversion."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--host=$TARGET_NAME \
            --build=$HOST_NAME \
            --prefix=/usr \
            --includedir=/usr/include/iconv \
            --libdir=/usr/lib/iconv \
            --sysconfdir=/etc \
            --enable-static \
            --disable-shared \
            --disable-nls \
            --disable-extra-encodings \
            --with-gnu-ld"
