################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-all"
PKG_VERSION="2.2.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="virtual"
PKG_SHORTDESC="vdr-all: Metapackage for installing VDR plugins"
PKG_LONGDESC="vdr-all is a Metapackage for installing VDR plugins"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-vnsiserver"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-dvbapi"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-epgsearch"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-live"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-streamdev"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-svdrpservice"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-epgsync"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-iptv"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-satip"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-channelscan"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-eepg"
