################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="syncthing"
PKG_VERSION="0.14.21"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MPLv2"
PKG_SITE="https://syncthing.net/"
PKG_URL="https://github.com/syncthing/syncthing/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain go:host"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="Syncthing: open source continuous file synchronization"
PKG_LONGDESC="Syncthing ($PKG_VERSION) replaces proprietary sync and cloud services with something open, trustworthy and decentralized. Your data is your data alone and you deserve to choose where it is stored, if it is shared with some third party and how it's transmitted over the Internet."
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

configure_target() {
  go run build.go assets

  mkdir -p $ROOT/$PKG_BUILD $ROOT/$PKG_BUILD/src/github.com/syncthing
  ln -fs $ROOT/$PKG_BUILD $ROOT/$PKG_BUILD/src/github.com/syncthing/syncthing
  ln -fs $ROOT/$PKG_BUILD/vendor $ROOT/$PKG_BUILD/vendor/src

  case $TARGET_ARCH in
    x86_64)
      export GOARCH=amd64
      ;;
    aarch64)
      export GOARCH=arm64
      ;;
    arm)
      export GOARCH=arm
      case $TARGET_CPU in
        arm1176jzf-s)
          export GOARM=6
          ;;
        cortex-a7|cortex-a9)
          export GOARM=7
          ;;
      esac
      ;;
  esac

  export GOOS=linux
  export CGO_ENABLED=1
  export CGO_NO_EMULATION=1
  export CGO_CFLAGS=$CFLAGS
  export LDFLAGS="-w -linkmode external -extldflags -Wl,--unresolved-symbols=ignore-in-shared-libs -extld $CC -X main.Version=v$PKG_VERSION"
  export GOLANG=$ROOT/$TOOLCHAIN/lib/golang/bin/go
  export GOPATH=$ROOT/$PKG_BUILD/src/github.com/syncthing/syncthing:$ROOT/$PKG_BUILD/vendor:$ROOT/$PKG_BUILD/Godeps/_workspace
  export GOROOT=$ROOT/$TOOLCHAIN/lib/golang
  export PATH=$PATH:$GOROOT/bin
}

make_target() {
  cd $ROOT/$PKG_BUILD/src/github.com/syncthing/syncthing
  mkdir -p bin
  $GOLANG build -v -o bin/syncthing -a -ldflags "$LDFLAGS" ./cmd/syncthing
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp -P bin/syncthing $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/* $INSTALL/usr/bin
}

post_install() {
  enable_service syncthing.service
}
