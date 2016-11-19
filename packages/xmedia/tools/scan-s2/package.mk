################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="scan-s2"
PKG_VERSION="46"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/scan-s2"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="DVB-T/S(T2/S2) scan utils"
PKG_LONGDESC="DVB-T/S(T2/S2) scan utils"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  CC=$CC CFLG=$LDFLAGS INCLUDE="-I $(kernel_path)" make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp -P $ROOT/$PKG_BUILD/scan-s2 $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/config/scan-s2
    cp -pR $PKG_DIR/config/* $INSTALL/usr/config/scan-s2
}
