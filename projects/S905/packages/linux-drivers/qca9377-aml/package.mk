################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="qca9377-aml"
PKG_REV="1"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://boundarydevices.com/new-silex-wifi-802-11ac-bt4-1-module/"
PKG_VERSION="boundary-LNX.LEH.4.2.2.2-4.5.20.034"
PKG_URL="https://github.com/boundarydevices/qcacld-2.0/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="qcacld-2.0-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="qca9377-aml"
PKG_LONGDESC="qca9377-aml"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$TARGET_KERNEL_ARCH" = "arm64" -a "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-linaro-aarch64-linux-gnu:host"
  export PATH=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-linux-gnu/bin/:$PATH
  TARGET_PREFIX=aarch64-linux-gnu-
fi

make_target() {
  ARCH=$TARGET_KERNEL_ARCH CROSS_COMPILE=$TARGET_PREFIX \
    LDFLAGS="" CFLAGS="" CONFIG_CLD_HL_SDIO_CORE=y KERNEL_SRC=$(kernel_path) make
}

makeinstall_target() {
  mkdir -p $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME
  cp $ROOT/$PKG_BUILD/wlan.ko $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME/
}
