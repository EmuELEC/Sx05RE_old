################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-iptv"
PKG_VERSION="2.2.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.saunalahti.fi/~rahrenbe/vdr/iptv/"
PKG_URL="http://www.saunalahti.fi/~rahrenbe/vdr/iptv/files/$PKG_NAME-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="iptv-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain vdr curl"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="vdr-iptv: an IPTV plugin for the Video Disk Recorder (VDR)"
PKG_LONGDESC="vdr-iptv is an IPTV plugin for the Video Disk Recorder (VDR)"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
       DVBCHANPATCH=1
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config
    mv -f $INSTALL/storage/.config/vdr $INSTALL/usr/config
  rm -rf $INSTALL/storage
}
