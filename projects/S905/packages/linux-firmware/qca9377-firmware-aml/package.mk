################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="qca9377-firmware-aml"
PKG_VERSION="1.0.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Free-to-use"
PKG_SITE="https://boundarydevices.com/product/bd_sdmac_wifi/"
PKG_URL="http://linode.boundarydevices.com/repos/apt/ubuntu-relx/pool/main/q/qca-firmware/qca-firmware_$PKG_VERSION.orig.tar.gz"
PKG_SOURCE_DIR="qca-firmware-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="firmware"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing todo
}

makeinstall_target() {
  mkdir -p $INSTALL/lib/firmware

  cp -P LICENSE.TXT $INSTALL/lib/firmware/LICENSE.qca
  cp -P *.bin $INSTALL/lib/firmware
  cp -PR qca $INSTALL/lib/firmware
  cp -PR wlan $INSTALL/lib/firmware
}
