################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libretro-mupen64plus"
PKG_VERSION="41724aa"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro"
PKG_URL="https://github.com/libretro/mupen64plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mupen64plus-libretro-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Libretro GL only. Libretro port of Mupen64 Plus."
PKG_LONGDESC="Libretro GL only. Libretro port of Mupen64 Plus."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  strip_lto
}

make_target() {
  case $PROJECT in
    RPi2)
      make platform=rpi2
      ;;
    PC)
      mkdir out
      make WITH_DYNAREC=$TARGET_ARCH
      mv *.so out/
      make clean
      make WITH_DYNAREC=$TARGET_ARCH HAVE_VULKAN=1
      mv *.so out/
      ;;
    S805)
      make platform=armv7-neon-gles-hardfloat-cortex-a5
      ;;
    S812)
      make platform=armv7-neon-gles-hardfloat-cortex-a9
      ;;
    S905)
      make platform=rpi3
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
    cp `find . -name "*.so" | xargs echo` $INSTALL/usr/lib/libretro/
}
