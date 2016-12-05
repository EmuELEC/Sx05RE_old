################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="qca9377-aml"
PKG_REV="1"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="http://openlinux.amlogic.com:8000/download/ARM/wifi/"
PKG_VERSION="8b729b7"
PKG_URL="https://github.com/tomatotech/mmallow_hardware_wifi_qualcomm_drivers_qca9377/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mmallow_hardware_wifi_qualcomm_drivers_qca9377-$PKG_VERSION*"
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
  make oldconfig \
       -C AIO/drivers/backports \
       CC=gcc \
       KLIB=$INSTALL \
       KLIB_BUILD=$(kernel_path)
  cd AIO/drivers
  LDFLAGS="" CFLAGS="" make \
    BOARD_TYPE=x86-android \
    KLIB=$INSTALL \
    KERNELPATH=$(kernel_path) \
    KERNELARCH=$TARGET_KERNEL_ARCH \
    CROSS_COMPILE=$TARGET_PREFIX \
    ATH_TOPDIR=$ROOT/$PKG_BUILD/AIO \
    TOOLPREFIX=${CROSS_COMPILE} \
    CFG80211_NAME=backports \
    CONFIG_CFG80211_INTERNAL_REGDB=y \
    CONFIG_PMF_SUPPORT=y \
    CONFIG_CLD_HL_SDIO_CORE=y \
    CONFIG_LINUX_QCMBR=y \
    CONFIG_ROME_IF=sdio \
    MAKEARCH="make ARCH=$TARGET_KERNEL_ARCH CROSS_COMPILE=$TARGET_PREFIX"
}

makeinstall_target() {
  mkdir -p $INSTALL/lib/modules/$PKG_NAME
  find $ROOT/$PKG_BUILD/ -name cfg80211.ko -exec cp {} $INSTALL/lib/modules/$PKG_NAME \;
  find $ROOT/$PKG_BUILD/ -name compat.ko -exec cp {} $INSTALL/lib/modules/$PKG_NAME \;
  find $ROOT/$PKG_BUILD/ -name wlan.ko -exec cp {} $INSTALL/lib/modules/$PKG_NAME \;
}
