################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="gevent"
PKG_VERSION="1.1.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://pypi.python.org/pypi/gevent"
PKG_URL="https://pypi.python.org/packages/source/g/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host greenlet"
PKG_SECTION="xmedia/torrent"
PKG_SHORTDESC="gevent is a coroutine-based Python networking library"
PKG_LONGDESC="gevent is a coroutine-based Python networking library."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  cd $ROOT/$PKG_BUILD
    sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' libev/configure
    sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' c-ares/configure

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
