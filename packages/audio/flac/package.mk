################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="flac"
PKG_VERSION="1.3.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://xiph.org/flac/"
PKG_URL="http://downloads.xiph.org/releases/flac/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libogg"
PKG_SECTION="audio"
PKG_SHORTDESC="flac: An Free Lossless Audio Codec"
PKG_LONGDESC="Grossly oversimplified, FLAC is similar to MP3, but lossless, meaning that audio is compressed in FLAC without throwing away any information. This is similar to how Zip works, except with FLAC you will get much better compression because it is designed specifically for audio."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --enable-shared \
                           --disable-rpath \
                           --disable-altivec \
                           --disable-doxygen-docs \
                           --disable-thorough-tests \
                           --disable-cpplibs \
                           --disable-xmms-plugin \
                           --disable-oggtest \
                           --with-ogg=$SYSROOT_PREFIX/usr \
                           --with-gnu-ld"

if [ $TARGET_ARCH = "x86_64" ]; then
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --enable-sse"
else
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --disable-sse"
fi

pre_configure_target() {
  # flac-1.3.1 dont build with LTO support
  strip_lto

  export CFLAGS="$CFLAGS -fPIC -DPIC"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
