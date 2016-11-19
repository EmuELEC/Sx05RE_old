################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libretro-ppsspp"
PKG_VERSION="ea17e27"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/libretro-ppsspp"
PKG_URL="$ALEXELEC_SRC/ppsspp-$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="ppsspp-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Libretro port of PPSSPP"
PKG_LONGDESC="A fast and portable PSP emulator"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_USE_CMAKE="no"

pre_configure_target() {
  strip_lto
}

make_target() {
  cd $ROOT/$PKG_BUILD/libretro
  SYSROOT_PREFIX=$SYSROOT_PREFIX make platform=imx6
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp ../libretro/ppsspp_libretro.so $INSTALL/usr/lib/libretro/
}
