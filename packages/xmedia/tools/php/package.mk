################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="php"
PKG_VERSION="5.6.27"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="OpenSource"
PKG_SITE="http://www.php.net"
PKG_URL="http://www.php.net/distributions/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib pcre curl libxml2 libressl libxslt libiconv"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="php: Scripting language especially suited for Web development"
PKG_LONGDESC="PHP is a widely-used general-purpose scripting language that is especially suited for Web development and can be embedded into HTML."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

post_unpack() {
  PHP_BUILD_DIR=$(get_build_dir php)
  echo "downloading pear..."
  if [ ! -f "$PHP_BUILD_DIR/../go-pear.phar" ]; then
    wget -O $PHP_BUILD_DIR/../go-pear.phar http://pear.php.net/go-pear.phar
  fi
  cp $PHP_BUILD_DIR/../go-pear.phar $PHP_BUILD_DIR/pear/go-pear.phar

  # libtool fix
  rm $ROOT/$PKG_BUILD/aclocal.m4
}

configure_target() {
  cd $ROOT/$PKG_BUILD
  rm -rf .$TARGET_NAME

  # Dynamic Library support
  export LDFLAGS="$LDFLAGS -ldl -lpthread"

  # libiconv
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/iconv"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib/iconv -liconv"

  export CXXFLAGS="$CFLAGS"
  export CPPFLAGS="$CFLAGS"

  PKG_CONFIGURE_OPTS_TARGET="--disable-all \
                             --enable-cli \
                             --enable-cgi \
                             --without-pear \
                             --localstatedir=/var \
                             --enable-sockets \
                             --enable-session \
                             --enable-posix \
                             --enable-mbstring \
                             --enable-json \
                             --with-openssl-dir=$SYSROOT_PREFIX/usr \
                             --with-curl=$SYSROOT_PREFIX/usr \
                             --with-openssl=$SYSROOT_PREFIX/usr \
                             --with-zlib=$SYSROOT_PREFIX/usr \
                             --with-bz2=$SYSROOT_PREFIX/usr \
                             --with-iconv \
                             --without-gettext \
                             --without-gmp \
                             --enable-pcntl \
                             --disable-sysvmsg \
                             --disable-sysvsem \
                             --disable-sysvshm \
                             --with-pcre-regex"

  ac_cv_func_strcasestr=yes \
  $PKG_CONFIGURE_SCRIPT $TARGET_CONFIGURE_OPTS $PKG_CONFIGURE_OPTS_TARGET
}

makeinstall_target() {
  make -j1 install INSTALL_ROOT=$INSTALL $PKG_MAKEINSTALL_OPTS_TARGET
  rm -f $INSTALL/usr/bin/php-config
  rm -f $INSTALL/usr/bin/phpize
  rm -fr $INSTALL/usr/lib
  rm -fr $INSTALL/usr/php
}
