################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="JsonSchemaBuilder"
PKG_VERSION="0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL=""
PKG_NEED_UNPACK="$ROOT/packages/mediacenter/kodi/package.mk"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="kodi-platform:"
PKG_LONGDESC="kodi-platform:"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_SCRIPT="$(get_build_dir kodi)/tools/depends/native/JsonSchemaBuilder/CMakeLists.txt"

PKG_CMAKE_OPTS_HOST="-Wno-dev"

pre_build_host() {
  $SCRIPTS/clean $PKG_NAME
}

makeinstall_host() {
  mkdir -p $ROOT/$TOOLCHAIN/bin
    cp JsonSchemaBuilder $ROOT/$TOOLCHAIN/bin
}