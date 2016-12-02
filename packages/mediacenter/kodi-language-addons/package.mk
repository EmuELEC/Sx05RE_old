################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="kodi-language-addons"
PKG_VERSION="2ca2dfd"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/repo-resources"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="mediacenter"
PKG_SHORTDESC="kodi language add-ons"
PKG_LONGDESC="kodi language add-ons"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/
    for lng in $KODI_LANGUAGE_LIST; do
        cp -PR $ROOT/$PKG_BUILD/*.$lng $INSTALL/usr/share/kodi/addons/
    done
}
