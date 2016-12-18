################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="device-trees"
PKG_VERSION="0.1"
PKG_REV="1"
PKG_LICENSE="OSS"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_AUTORECONF="no"

EXTRA_TREES=(gxbb_p201.dtb gxl_p212_1g.dtb gxl_p212_2g.dtb)

if [ "$TARGET_KERNEL_ARCH" = "arm64" -a "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET gcc-linaro-aarch64-linux-gnu:host"
  export PATH=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-linux-gnu/bin/:$PATH
  TARGET_PREFIX=aarch64-linux-gnu-
fi

make_target() {
  pushd $ROOT/$BUILD/linux-$(kernel_version) > /dev/null

  mkdir -p $TARGET_IMG

  # Complete device trees
  for f in $PKG_DIR/sources/*.dts; do
    if [ -e $f ]; then
      DTB_NAME="$(basename $f .dts).dtb"
      cp -f $f arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/
      LDFLAGS="" make $DTB_NAME
      mv arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/$DTB_NAME $TARGET_IMG
    fi
  done

  # Patched device trees
  for f in $PKG_DIR/sources/*.patch; do
    if [ -e $f ]; then
      DTB_NAME="$(basename $f .patch).dtb"
      DTS_NAME="$(basename $f .patch).dts"
      patch -d arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/ -o $DTS_NAME --merge < $f
      LDFLAGS="" make $DTB_NAME
      mv arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/$DTB_NAME $TARGET_IMG
    fi
  done

  # Kernel-tree trees
  for f in ${EXTRA_TREES[@]}; do
    LDFLAGS="" make $f
    mv arch/$TARGET_KERNEL_ARCH/boot/dts/amlogic/$f $TARGET_IMG
  done

  popd > /dev/null
}

makeinstall_target() {
  : # nop
}
