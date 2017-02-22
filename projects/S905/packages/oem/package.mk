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
  if [ -e "$PROJECT_DIR/$PROJECT/install/files/logo.img" ]; then
    mkdir -p $ROOT/$BUILD/image/system/usr/share/bootloader
    cp -f $PROJECT_DIR/$PROJECT/install/files/logo.img $ROOT/$BUILD/image/system/usr/share/bootloader
  fi
}



if [ "$TARGET_ARCH" = "aarch64" ]; then
  # 32bit libs
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET 32bit-libs"
else
  # games
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation retroarch"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-mupen64plus"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-ppsspp"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-pcsx_rearmed"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-genesis-plus-gx"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-snes9x2010"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-mame2003"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-fbalpha"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-fuse"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-nestopia"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-picodrive"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-vba-next"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-gambatte"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libretro-beetle-pce-fast"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET stella"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET prosystem"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET atari800"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET glupen64"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET ppsspp"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET advmame"
 #PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET PPSSPPSDL"
fi


