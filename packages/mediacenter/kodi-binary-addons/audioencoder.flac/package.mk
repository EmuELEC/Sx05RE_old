################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="audioencoder.flac"
PKG_VERSION="f7a8daa"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="https://github.com/xbmc/audioencoder.flac/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform flac"
PKG_SECTION=""
PKG_SHORTDESC="audioencoder.flac: A audioencoder addon for Kodi"
PKG_LONGDESC="audioencoder.flac is a audioencoder addon for Kodi"
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.audioencoder"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_MODULE_PATH=$SYSROOT_PREFIX/usr/lib/kodi \
                       -DCMAKE_PREFIX_PATH=$SYSROOT_PREFIX/usr \
                       -DFLAC_INCLUDE_DIRS=$SYSROOT_PREFIX/usr/include \
                       -DOGG_INCLUDE_DIRS=$SYSROOT_PREFIX/usr/include"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/
  cp -R $PKG_BUILD/.install_pkg/usr/share/kodi/addons/$PKG_NAME/* $ADDON_BUILD/$PKG_ADDON_ID/

  ADDONSO=$(xmlstarlet sel -t -v "/addon/extension/@library_linux" $ADDON_BUILD/$PKG_ADDON_ID/addon.xml)
  cp -L $PKG_BUILD/.install_pkg/usr/lib/kodi/addons/$PKG_NAME/$ADDONSO $ADDON_BUILD/$PKG_ADDON_ID/
}
