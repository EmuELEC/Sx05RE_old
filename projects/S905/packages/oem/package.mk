################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="oem"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="various"
PKG_SITE="http://alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain rng-tools u-boot-tools"
PKG_SECTION="virtual"
PKG_SHORTDESC="OEM: Metapackage for various OEM packages"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_install() {
  if [ -n "$DEVICE" -a -d "$PROJECT_DIR/$PROJECT/devices/$DEVICE/filesystem" ]; then
    cp -LR $PROJECT_DIR/$PROJECT/devices/$DEVICE/filesystem/* $ROOT/$BUILD/image/system
  fi
}

# services net
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET acestream-aml"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET aceproxy"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET transmission"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET minidlna"

# tv services
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-all wicard"

# tools
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET ImageMagick mc aml-vnc scan-s2 scan-m3u serviceref"

# 32bit libs
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET 32bit-libs"
