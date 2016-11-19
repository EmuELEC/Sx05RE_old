################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="wget"
PKG_VERSION="1.18"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.wget-editor.org/"
PKG_URL="http://ftp.gnu.org/gnu/wget/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libressl pcre"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="wget: A non-interactive network retriever"
PKG_LONGDESC="GNU Wget is a free network utility to retrieve files from the World Wide Web using HTTP and FTP, the two most widely used Internet protocols. It works non-interactively, thus enabling work in the background, after having logged off. The recursive retrieval of HTML pages, as well as FTP sites is supported -- you can use Wget to make mirrors of archives and home pages, or traverse the web like a WWW robot (Wget understands /robots.txt)."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-nls \
                           --disable-rpath \
                           --with-gnu-ld \
                           --with-ssl=openssl \
                           --with-openssl=yes"

post_makeinstall_target() {
  rm -rf $INSTALL/etc
}
