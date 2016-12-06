################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="32bit-libs"
PKG_VERSION="0.1"
PKG_REV="1"
PKG_ARCH="aarch64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="32bit libs for Amlogic arm64 and Libretro"
PKG_LONGDESC="32bit libs for Amlogic arm64 and Libretro."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

# for Retroarch
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET retroarch-assets retroarch-joypad-autoconfig common-shaders libretro-database"

# Emulationstation
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-simple-dark"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET emulationstation-theme-carbon"

make_target() {
  : none
}

makeinstall_target() {
  mkdir -p src32
    mount -t squashfs -o loop SYSTEM src32

  # Libs
  mkdir -p $INSTALL/lib
  mkdir -p $INSTALL/lib32
  mkdir -p $INSTALL/usr/lib32
    cp -PR src32/lib/* $INSTALL/lib32
    cp -PR src32/usr/lib/* $INSTALL/usr/lib32

  # RetroArch
  mkdir -p $INSTALL/etc
    cp src32/etc/retroarch.cfg $INSTALL/etc
  mkdir -p $INSTALL/usr/bin
    cp src32/usr/bin/retroarch $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/share
    cp -a src32/usr/share/video_filters $INSTALL/usr/share
    cp -a src32/usr/share/audio_filters $INSTALL/usr/share
  mkdir -p $INSTALL/usr/config
    cp -a src32/usr/config/retroarch $INSTALL/usr/config

  umount src32
    ln -sf /lib32/ld-linux-armhf.so.3 $INSTALL/lib/ld-linux.so.3
    ln -sf /lib32/ld-linux-armhf.so.3 $INSTALL/lib/ld-linux-armhf.so.3
  # RetroArch games
  mkdir -p $INSTALL/usr/lib
    ln -sf /usr/lib32/libretro $INSTALL/usr/lib/libretro
}

post_install() {
  # fix emustation.service
  cp -f $ROOT/$PKG_DIR/system.d.opt/emustation.service $INSTALL/usr/lib/systemd/system/emustation.service

  enable_service tmp-assets.mount
  enable_service tmp-cores.mount
  enable_service tmp-database.mount
  enable_service tmp-joypads.mount
  enable_service tmp-shaders.mount
}
