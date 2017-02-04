################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)f1b63bd  9d7fe2c
################################################################################

PKG_NAME="retroarchm"
PKG_VERSION="f1b63bd"
PKG_REV="1"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/RetroArch"
PKG_URL="none"
PKG_DEPENDS_TARGET="toolchain samba avahi nss-mdns ffmpeg alsa-lib freetype zlib common-overlays"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Reference frontend for the libretro API."
PKG_LONGDESC="RetroArch is the reference frontend for the libretro API. Popular examples of implementations for this API includes videogame system emulators and game engines, but also more generalized 3D programs. These programs are instantiated as dynamic libraries. We refer to these as libretro cores."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGLES"

unpack() {
  git clone --recursive https://github.com/libretro/RetroArch $PKG_BUILD
  cd $PKG_BUILD
  git reset --hard $PKG_VERSION
  rm -rf .git
  cd $ROOT
}

TARGET_CONFIGURE_OPTS=""
PKG_CONFIGURE_OPTS_TARGET="--disable-vg \
                           --disable-sdl \
                           --disable-xvideo \
                           --disable-al \
                           --disable-oss \
                           --enable-opengles \
                           --disable-kms \
                           --enable-mali_fbdev \
                           --enable-neon \
                           --enable-fbo \
                           --enable-zlib \
                           --enable-freetype"

pre_configure_target() {
  strip_lto
  cd $ROOT/$PKG_BUILD
  echo $PKG_VERSION > .gitversion
}

make_target() {
  make V=1
 
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp $ROOT/$PKG_BUILD/retroarch $INSTALL/usr/bin/retroarchm
 mkdir -p $INSTALL/usr/config/
cp $PKG_DIR/autostart.sh $INSTALL/usr/config/autostart.sh



}

