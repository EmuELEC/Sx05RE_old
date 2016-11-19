################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="scan-m3u"
PKG_VERSION="1.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="scan-m3u: scan IPTV channels for VDR"
PKG_LONGDESC="scan-m3u: scan IPTV channels for VDR."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  export LDFLAGS="$LDFLAGS -fPIC"
}

make_target() {
  cp -aP $PKG_DIR/source/* ./
  CC=$CC CFLAGS=$CFLAGS ./shc -v -r -B -f m3u_info.src
  CC=$CC CFLAGS=$CFLAGS ./shc -v -r -B -f scan-m3u.src
  CC=$CC CFLAGS=$CFLAGS ./shc -v -r -B -f scan-ttv.src
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp m3u_kill $INSTALL/usr/bin/m3u_kill
    cp m3u_info.src.x $INSTALL/usr/bin/m3u_info
    cp scan-m3u.src.x $INSTALL/usr/bin/scan-m3u
    cp scan-ttv.src.x $INSTALL/usr/bin/scan-ttv
}
