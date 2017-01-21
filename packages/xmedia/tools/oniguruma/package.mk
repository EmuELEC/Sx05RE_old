################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="oniguruma"
PKG_VERSION="6.1.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kkos/oniguruma"
PKG_URL="https://github.com/kkos/oniguruma/releases/download/v$PKG_VERSION/onig-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="onig-*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="a regular expressions library"
PKG_LONGDESC="a regular expressions library."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share
}
