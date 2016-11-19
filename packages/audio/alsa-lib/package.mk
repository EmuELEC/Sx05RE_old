################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="alsa-lib"
PKG_VERSION="1.1.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alsa-project.org/"
PKG_URL="ftp://ftp.alsa-project.org/pub/lib/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="audio"
PKG_SHORTDESC="alsa-lib: Advanced Linux Sound Architecture library"
PKG_LONGDESC="ALSA (Advanced Linux Sound Architecture) is the next generation Linux Sound API. It provides much finer (->better) access to the sound hardware, has a unbeatable mixer API and supports stuff like multi channel hardware, digital outs and ins, uninterleaved sound data access, and an oss emulation layer (for the old applications). It is the prefered API for professional sound apps under Linux."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

if [ "$DEBUG" = yes ]; then
  ALSA_DEBUG=--with-debug
else
  ALSA_DEBUG=--without-debug
fi

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--with-plugindir=/usr/lib/alsa \
                           --disable-python \
                           $ALSA_DEBUG \
                           --disable-dependency-tracking"

pre_configure_target() {
  CFLAGS="$CFLAGS -fPIC -DPIC"

  # alsa-lib fails building with LTO support
    strip_lto
}

post_configure_target() {
  sed -i 's/.*PKGLIBDIR.*/#define PKGLIBDIR ""/' include/config.h
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/config
    cp -PR $PKG_DIR/config/* $INSTALL/usr/config
}

post_install() {
  add_group audio 63
}
