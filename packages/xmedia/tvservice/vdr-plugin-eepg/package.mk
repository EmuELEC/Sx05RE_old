################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-eepg"
PKG_VERSION="9cd9a75"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-eepg"
PKG_URL="https://projects.vdr-developer.org/git/$PKG_NAME.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="vdr-plugin-eepg"
PKG_LONGDESC="This plugin parses the Extended (2 to 10 day) EPG data which is send by providers on their portal channels. This EEPG data is transmitted in a non-standard format on a non-standard PID."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR
}
