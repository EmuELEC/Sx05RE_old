################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="go"
PKG_VERSION="1.7.5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://golang.org"
PKG_URL="https://github.com/golang/go/archive/${PKG_NAME}${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_NAME}${PKG_VERSION}"
PKG_DEPENDS_HOST="toolchain"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."
PKG_LONGDESC="Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

################################################################################
# $ wget https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
# $ tar xf go1.7.5.linux-amd64.tar.gz -C /opt/
# $ ln -s /opt/go /usr/lib/golang
# $ apt install golang
################################################################################

configure_host() {
  export GOOS=linux
  export GOROOT_FINAL=$ROOT/$TOOLCHAIN/lib/golang
  export GOROOT_BOOTSTRAP=/usr/lib/golang
  export GOARCH=amd64
}

make_host() {
  cd $ROOT/$PKG_BUILD/src
  bash make.bash --no-banner
}

pre_makeinstall_host() {
  # need to cleanup old golang version when updating to a new version
  rm -rf $ROOT/$TOOLCHAIN/lib/golang
}

makeinstall_host() {
  mkdir -p $ROOT/$TOOLCHAIN/lib/golang
    cp -av $ROOT/$PKG_BUILD/* $ROOT/$TOOLCHAIN/lib/golang/
}
