################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="gpu-aml"
PKG_REV="1"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/gpu/"
# r5p1
PKG_VERSION="9b0fbbc"
PKG_URL="https://github.com/openwetek/gpu-aml/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="gpu-aml-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="gpu-aml: Linux drivers for Mali GPUs found in Amlogic Meson SoCs"
PKG_LONGDESC="gpu-aml: Linux drivers for Mali GPUs found in Amlogic Meson SoCs"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$TARGET_KERNEL_ARCH" = "arm64" -a "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-linaro-aarch64-linux-gnu:host"
  export PATH=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-linux-gnu/bin/:$PATH
  TARGET_PREFIX=aarch64-linux-gnu-
fi

make_target() {
  LDFLAGS="" make -C $(kernel_path) M=$ROOT/$PKG_BUILD/mali \
    CONFIG_MALI400=m CONFIG_MALI450=m
}

makeinstall_target() {
  LDFLAGS="" make -C $(kernel_path) M=$ROOT/$PKG_BUILD/mali \
    INSTALL_MOD_PATH=$INSTALL INSTALL_MOD_STRIP=1 DEPMOD=: \
  modules_install
}
