################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="jq"
PKG_VERSION="1.5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://stedolan.github.io/jq/"
PKG_URL="https://github.com/stedolan/jq/releases/download/$PKG_NAME-$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain oniguruma"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="Command-line JSON processor"
PKG_LONGDESC="jq is like sed for JSON data – you can use it to slice and filter and map and transform structured data with the same ease that sed, awk, grep and friends let you play with text."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \ 
                           --enable-static \
                           --disable-maintainer-mode"
