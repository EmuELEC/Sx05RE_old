################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="kodi-theme-Estuary"
GIT_VERSION="53a5c83"
PKG_VERSION="17.0-rc4-$GIT_VERSION"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="mediacenter"
PKG_SHORTDESC="kodi-theme-Estuary: Kodi Mediacenter default theme"
PKG_LONGDESC="Kodi Media Center (which was formerly named Xbox Media Center and XBMC) is a free and open source cross-platform media player and home entertainment system software with a 10-foot user interface designed for the living-room TV. Its graphical user interface allows the user to easily manage video, photos, podcasts, and music from a computer, optical disk, local network, and the internet using a remote control."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  TexturePacker -input media/ \
                -output Textures.xbt \
                -dupecheck \
                -use_none

  for theme in themes/*; do
    TexturePacker -input $theme \
                -output $(basename $theme).xbt \
                -dupecheck
  done
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/skin.estuary
    cp -R */ $INSTALL/usr/share/kodi/addons/skin.estuary
    cp *.txt $INSTALL/usr/share/kodi/addons/skin.estuary
    cp *.xml $INSTALL/usr/share/kodi/addons/skin.estuary
      rm -rf $INSTALL/usr/share/kodi/addons/skin.estuary/media

  mkdir -p $INSTALL/usr/share/kodi/addons/skin.estuary/media
    cp Textures.xbt $INSTALL/usr/share/kodi/addons/skin.estuary/media
    for theme in themes/*; do
      cp $(basename $theme).xbt $INSTALL/usr/share/kodi/addons/skin.estuary/media
    done
}
