################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="gcc-linaro-aarch64-linux-gnu"
PKG_VERSION="5.3-2016.02"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL="https://releases.linaro.org/components/toolchain/binaries/${PKG_VERSION}/aarch64-linux-gnu/gcc-linaro-${PKG_VERSION}-x86_64_aarch64-linux-gnu.tar.xz"
PKG_SOURCE_DIR="gcc-linaro-${PKG_VERSION}-x86_64_aarch64-linux-gnu"
PKG_DEPENDS_HOST="toolchain"
PKG_SECTION="lang"
PKG_SHORTDESC=""
PKG_LONGDESC=""
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_host() {
  :
}

makeinstall_host() {
  mkdir -p ${ROOT}/${TOOLCHAIN}/lib/gcc-linaro-aarch64-linux-gnu/
    cp -a * ${ROOT}/${TOOLCHAIN}/lib/gcc-linaro-aarch64-linux-gnu
}
