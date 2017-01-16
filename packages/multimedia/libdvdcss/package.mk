################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libdvdcss"
PKG_VERSION="2f12236"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/libdvdcss"
PKG_URL="https://github.com/xbmc/libdvdcss/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="multimedia"
PKG_SHORTDESC="libdvdcss: a simple library designed for accessing DVDs as a block device without having to bother about the decryption."
PKG_LONGDESC="libdvdcss is a simple library designed for accessing DVDs as a block device without having to bother about the decryption."
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
