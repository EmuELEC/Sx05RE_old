################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="openssh"
PKG_VERSION="7.2p2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.openssh.com/"
PKG_URL="ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib libressl"
PKG_SECTION="network"
PKG_SHORTDESC="openssh: An open re-implementation of the SSH package"
PKG_LONGDESC="This is a Linux port of OpenBSD's excellent OpenSSH. OpenSSH is based on the last free version of Tatu Ylonen's SSH with all patent-encumbered algorithms removed, all known security bugs fixed, new features reintroduced, and many other clean-ups. SSH (Secure Shell) is a program to log into another computer over a network, to execute commands in a remote machine, and to move files from one machine to another. It provides strong authentication and secure communications over insecure channels. It is intended as a replacement for rlogin, rsh, rcp, and rdist."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--sysconfdir=/etc/ssh \
                           --libexecdir=/usr/lib/openssh \
                           --disable-strip \
                           --disable-lastlog \
                           --with-sandbox=no \
                           --disable-utmp \
                           --disable-utmpx \
                           --disable-wtmp \
                           --disable-wtmpx \
                           --without-rpath \
                           --with-ssl-engine \
                           --disable-pututline \
                           --disable-pututxline \
                           --disable-etc-default-login \
                           --with-keydir=/storage/.cache/ssh \
                           --without-pam"

pre_configure_target() {
  export LD="$CC"
  export LDFLAGS="$TARGET_CFLAGS $TARGET_LDFLAGS"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/lib/openssh/ssh-keysign
  rm -rf $INSTALL/usr/lib/openssh/ssh-pkcs11-helper
  if [ ! $SFTP_SERVER = "yes" ]; then
    rm -rf $INSTALL/usr/lib/openssh/sftp-server
  fi
  rm -rf $INSTALL/usr/bin/ssh-add
  rm -rf $INSTALL/usr/bin/ssh-agent
  rm -rf $INSTALL/usr/bin/ssh-keyscan

  mkdir -p $INSTALL/usr/share/services
    cp -P $PKG_DIR/default.d/*.conf $INSTALL/usr/share/services

  sed -e "s|^#PermitRootLogin.*|PermitRootLogin yes|g" \
      -e "s|^#StrictModes.*|StrictModes no|g" \
      -e "s|^#UsePrivilegeSeparation.*|UsePrivilegeSeparation no|g" \
      -i $INSTALL/etc/ssh/sshd_config

  echo "PubkeyAcceptedKeyTypes +ssh-dss" >> $INSTALL/etc/ssh/sshd_config

  debug_strip $INSTALL/usr
}

post_install() {
  enable_service sshd-defaults.service
  enable_service sshd.service
}
