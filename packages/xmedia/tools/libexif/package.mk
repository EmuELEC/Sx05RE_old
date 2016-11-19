################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libexif"
PKG_VERSION="0.6.21"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://sourceforge.net/projects/libexif"
PKG_URL="http://downloads.sf.net/sourceforge/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="library to parse EXIF files"
PKG_LONGDESC="Most digital cameras produce EXIF files, which are JPEG files with extra tags that contain information about the image. The EXIF library allows you to parse an EXIF file and read the data from those tags."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-nls"

post_makeinstall_target() {
  # pkgconf hack
  $SED "s:\([':\" ]\)-I\${includedir}:\\1-I$SYSROOT_PREFIX/usr/include:g" $SYSROOT_PREFIX/usr/lib/pkgconfig/libexif.pc
}
