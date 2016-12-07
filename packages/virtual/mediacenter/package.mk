################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $MEDIACENTER"
PKG_SECTION="virtual"
PKG_SHORTDESC="Mediacenter: Metapackage"
PKG_LONGDESC=""
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

# kodi skins
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$SKIN_DEFAULT"

  for i in $SKINS; do
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$i"
  done

# some python stuff needed for various addons
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Pillow simplejson pycrypto xmlstarlet"

# other packages
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET peripheral.joystick"

# system settings addons
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET System-settings"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Alexelec-settings"

  if [ "$KODI_LANGUAGE_ADDONS" = "yes" ]; then
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET kodi-language-addons"
  fi

# kodi-binary-addons pvr
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.iptvsimple"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.vdr.vnsi"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.hts"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.dvblink"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.vuplus"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.stalker"

# kodi-binary-addons inputstream
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET inputstream.rtmp"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET inputstream.adaptive"

# kodi-binary-addons visualization
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET visualization.spectrum"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET visualization.waveform"

# audioencoder
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET audioencoder.flac"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET audioencoder.lame"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET audioencoder.vorbis"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET audioencoder.wav"
