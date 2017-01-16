################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libdvdread"
PKG_VERSION="17d99db"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/libdvdread"
PKG_URL="https://github.com/xbmc/libdvdread/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libdvdcss"
PKG_SECTION="multimedia"
PKG_SHORTDESC="libdvdread: a library which provides a simple foundation for reading DVDs."
PKG_LONGDESC="libdvdread is a library which provides a simple foundation for reading DVDs."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  : none
}

make_target() {
  : none
}

makeinstall_target() {
  : none
}
