################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="initramfs"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain libc:init busybox:init linux:init plymouth-lite:init util-linux:init e2fsprogs:init dosfstools:init"
PKG_SECTION="virtual"
PKG_SHORTDESC="initramfs: Metapackage for installing initramfs"
PKG_LONGDESC="debug is a Metapackage for installing initramfs"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$ISCSI_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET open-iscsi:init"
fi

if [ "$INITRAMFS_PARTED_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET util-linux:init"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET e2fsprogs:init"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET parted:init"
fi

post_install() {
  ( cd $ROOT/$BUILD/initramfs
    if [ "$TARGET_KERNEL_ARCH" = "arm64" -a "$TARGET_ARCH" = "arm" ]; then
      STRIP=$ROOT/$TOOLCHAIN/lib/gcc-linaro-aarch64-linux-gnu/bin/aarch64-linux-gnu-strip
    fi

    for MOD in `find ./lib/modules/ -type f -name *.ko`; do
      $STRIP --strip-debug $MOD
    done

    mkdir -p $ROOT/$BUILD/image/
    fakeroot -- sh -c \
      "mkdir -p dev; mknod -m 600 dev/console c 5 1; find . | cpio -H newc -ov -R 0:0 | lzop > $ROOT/$BUILD/image/initramfs.cpio"
  )
}
