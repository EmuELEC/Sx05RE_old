################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-satip"
PKG_VERSION="2.2.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.saunalahti.fi/~rahrenbe/vdr/satip/"
PKG_URL="http://www.saunalahti.fi/~rahrenbe/vdr/satip/files/$PKG_NAME-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="satip-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain vdr curl tinyxml"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="vdr-satip: SAT>IP plugin for VDR"
PKG_LONGDESC="vdr-satip is a SAT>IP plugin for VDR"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR SATIP_USE_TINYXML=1
}
