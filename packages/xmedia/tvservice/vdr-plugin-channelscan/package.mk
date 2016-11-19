################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-channelscan"
PKG_VERSION="6ea9bad"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/ua0lnj/channelscan"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="VDR -- channel scan plugin"
PKG_LONGDESC="channelscan is a plugin for VDR, the Video Disk Recorder."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : not
}

makeinstall_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
       DVBCHANPATCH=1 \
	   DESTDIR=$INSTALL \
       install
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/vdr/plugins/transponders
    cp $PKG_DIR/transponders/* $INSTALL/usr/config/vdr/plugins/transponders
}
