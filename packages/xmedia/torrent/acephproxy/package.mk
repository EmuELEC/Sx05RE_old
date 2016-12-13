################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="acephproxy"
PKG_VERSION="e6a1d76"
PKG_REV="2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/AlexELEC/acephproxy"
PKG_URL="https://github.com/AlexELEC/acephproxy/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain php"
PKG_SECTION="xmedia/torrent"
PKG_SHORTDESC="AcePHProxy: PHP proxy daemon for Ace Stream"
PKG_LONGDESC="AcePHProxy: PHP proxy daemon for Ace Stream."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  DESTDIR=$INSTALL ./install
}

post_install() {
  enable_service acephproxy.service
}
