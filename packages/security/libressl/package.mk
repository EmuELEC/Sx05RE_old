################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libressl"
PKG_VERSION="2.3.8"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="http://www.libressl.org/"
PKG_URL="http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="security"
PKG_SHORTDESC="libressl: a FREE version of the SSL/TLS protocol forked from OpenSSL"
PKG_LONGDESC="LibreSSL is a FREE version of the SSL/TLS protocol forked from OpenSSL"

PKG_IS_ADDON="no"
PKG_USE_CMAKE="no"
PKG_AUTORECONF="yes"

SSL_CERTIFICATES="/etc/ssl"

post_makeinstall_target() {
  # create new cert: perl ./mk-ca-bundle.pl
  mkdir -p $INSTALL/$SSL_CERTIFICATES
    cp $PKG_DIR/cert/ca-bundle.crt $INSTALL/$SSL_CERTIFICATES/cacert.pem
  # backwards comatibility
  mkdir -p $INSTALL/etc/pki/tls
    ln -sf $SSL_CERTIFICATES/cacert.pem $INSTALL/etc/pki/tls/cacert.pem
    ln -sf $SSL_CERTIFICATES/cacert.pem $INSTALL/etc/ssl/cert.pem
  # for VDR-LIVE
  mkdir -p $INSTALL/usr/config/ssl
    cp $PKG_DIR/config/openssl.cnf $INSTALL/usr/config/ssl
    ln -sf /storage/.config/ssl/openssl.cnf $INSTALL/etc/ssl/openssl.cnf
}
