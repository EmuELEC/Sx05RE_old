################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="s2-liplianin"
PKG_VERSION="v39.40"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/s2-liplianin-v39/"
PKG_URL="$ALEXELEC_SRC/linux-$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="linux-$PKG_NAME-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="xmedia/dvb"
PKG_SHORTDESC="DVB-S(S2) drivers for Linux - Igor M. Liplianin repo (v39)"
PKG_LONGDESC="DVB-S(S2) drivers for Linux - Igor M. Liplianin repo (v39)."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$TARGET_KERNEL_ARCH" = "arm64" -a "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-linaro-aarch64-linux-gnu:host"
  export PATH=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-linux-gnu/bin/:$PATH
  TARGET_PREFIX=aarch64-linux-gnu-
fi

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  cd $ROOT/$PKG_BUILD
  make DIR=$(kernel_path) clean
  make DIR=$(kernel_path) prepare
  sed -i -e "s|^CONFIG_VIDEO_S5C73M3=.*$|# CONFIG_VIDEO_S5C73M3 is not set|" v4l/.config
  make DIR=$(kernel_path)
}

makeinstall_target() {
  : # not
}

post_install() {
  MOD_VER=$(get_module_dir)

  # install s2-liplianin drivers
  cp -Pa $INSTALL/lib/modules/$MOD_VER $INSTALL/lib/modules/$MOD_VER-s2
  mkdir -p $INSTALL/lib/modules/$MOD_VER-s2/updates/s2
  find $ROOT/$PKG_BUILD/ -name \*.ko -exec cp {} $INSTALL/lib/modules/$MOD_VER-s2/updates/s2 \;
  rm -f  $INSTALL/lib/modules/$MOD_VER-s2/updates/s2/lirc_dev.ko
  rm -f  $INSTALL/lib/modules/$MOD_VER-s2/updates/s2/rc-core.ko
  echo "s2-liplianin drivers version: $PKG_VERSION" > $INSTALL/lib/modules/$MOD_VER-s2/updates/s2-drivers.txt
}
