################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="psutil"
PKG_VERSION="4.1.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://pypi.python.org/pypi/psutil/"
PKG_URL="https://pypi.python.org/packages/source/p/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host"
PKG_SECTION="xmedia/torrent"
PKG_SHORTDESC="A cross-platform process and system utilities module for Python2"
PKG_LONGDESC="psutil is a cross-platform library for retrieving information onrunning processes and system utilization (CPU, memory, disks, network)in Python."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/$PKG_NAME-*.egg-info
}
