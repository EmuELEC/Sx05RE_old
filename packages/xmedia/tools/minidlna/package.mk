################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="minidlna"
PKG_VERSION="d1cd7c7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://minidlna.sourceforge.net/"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain sqlite libexif libid3tag flac libvorbis"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="MiniDLNA is server software with the aim of being fully compliant with DLNA/UPnP-AV clients"
PKG_LONGDESC="MiniDLNA is server software with the aim of being fully compliant with DLNA/UPnP-AV clients."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"
PKG_LOCALE_INSTALL="yes"

pre_configure_target() {
 # minidlna fails to build in subdirs
 cd $ROOT/$PKG_BUILD
 rm -rf .$TARGET_NAME
}

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
			               --sbindir=/usr/bin \
                           --with-os-name="AlexELEC" \
			               --with-os-version="$ALEXELEC_VERSION" \
			               --with-os-url="www.alexelec.in.ua" \
			               --with-log-path=/var/log \
			               --with-db-path=/storage/.cache/minidlna"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/minidlna
    cp -PR $PKG_DIR/config/*.conf $INSTALL/usr/config/minidlna
}

post_install() {
  enable_service minidlna.service
}
