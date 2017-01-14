################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="kodi-theme-AeonNox"
PKG_VERSION="bbd197d"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/BigNoid/Aeon-Nox"
PKG_URL="https://github.com/BigNoid/Aeon-Nox/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Aeon-Nox-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_SECTION="mediacenter"
PKG_SHORTDESC="kodi-theme-AeonNox: Kodi Mediacenter theme"
PKG_LONGDESC="kodi-theme-AeonNox: Kodi Mediacenter theme."
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
  rm -f resources/screenshot-*.jpg
  mkdir -p $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae
    cp -R */ $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae
    cp *.txt $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae
    cp *.xml $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae
      rm -rf $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae/media

  mkdir -p $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae/media
    cp Textures.xbt $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae/media
    for theme in themes/*; do
      cp $(basename $theme).xbt $INSTALL/usr/config/kodi.skins/skin.aeon.nox.5ae/media
    done

  mkdir -p $INSTALL/usr/share/kodi/addons
  ln -sf /storage/.config/kodi.skins/skin.aeon.nox.5ae $INSTALL/usr/share/kodi/addons/skin.aeon.nox.5ae
}
