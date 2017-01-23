################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr"
PKG_VERSION="2.2.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvdr.de"
PKG_URL="ftp://ftp.tvdr.de/vdr/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain fontconfig freetype libcap libjpeg-turbo bzip2 linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="vdr: A powerful DVB TV application"
PKG_LONGDESC="This project describes how to build your own digital satellite receiver and video disk recorder. It is based mainly on the DVB-S digital satellite receiver card, which used to be available from Fujitsu Siemens and the driver software developed by the LinuxTV project."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

post_unpack() {
  rm -rf $PKG_BUILD/PLUGINS/src/*
}

pre_configure_target() {
  export LDFLAGS=$(echo $LDFLAGS | sed -e "s|-Wl,--as-needed||")
}

pre_make_target() {
cat > Make.config <<EOF
PREFIX    = /usr
BINDIR    = /usr/bin
INCDIR    = /usr/include
LIBDIR    = /usr/lib/vdr
LOCDIR    = /usr/share/locale
MANDIR    = /usr/share/man
PCDIR     = /usr/lib/pkgconfig
RESDIR    = /storage/.config/vdr
VIDEODIR = /storage/recordings
CONFDIR = /storage/.config/vdr
CACHEDIR  = /storage/.cache/vdr

VDR_USER=root
NO_KBD=yes
EOF
}

make_target() {
  make vdr
  make include-dir
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/vdr
    cp $PKG_DIR/config/* $INSTALL/usr/config/vdr
    cp scr.conf $INSTALL/usr/config/vdr
    cp svdrphosts.conf $INSTALL/usr/config/vdr
    rm -f $INSTALL/usr/bin/svdrpsend
    rm -rf $INSTALL/storage

  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/* $INSTALL/usr/bin
}

post_install() {
  enable_service vdr.service
}
