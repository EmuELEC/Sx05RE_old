################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2017 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="kodi"
GIT_VERSION="d229f1f"
PKG_VERSION="17.0-rc4-$GIT_VERSION"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain JsonSchemaBuilder:host TexturePacker:host xmlstarlet:host Python zlib systemd pciutils lzo pcre swig:host libass curl fontconfig fribidi tinyxml libjpeg-turbo freetype libcdio taglib libxml2 libxslt yajl sqlite ffmpeg crossguid giflib libdvdnav libhdhomerun"
PKG_SECTION="mediacenter"
PKG_SHORTDESC="kodi: Kodi Mediacenter"
PKG_LONGDESC="Kodi Media Center (which was formerly named Xbox Media Center or XBMC) is a free and open source cross-platform media player and home entertainment system software with a 10-foot user interface designed for the living-room TV. Its graphical user interface allows the user to easily manage video, photos, podcasts, and music from a computer, optical disk, local network, and the internet using a remote control."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_SCRIPT="$ROOT/$PKG_BUILD/project/cmake/CMakeLists.txt"

  get_graphicdrivers

  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dbus"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libX11 libXext libdrm libXrandr"
  KODI_XORG="-DENABLE_X11=ON"
else
  KODI_XORG="-DENABLE_X11=OFF"
fi

if [ ! "$OPENGL" = "no" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL glu"
  KODI_OPENGL="-DENABLE_OPENGL=ON"
else
  KODI_OPENGL="-DENABLE_OPENGL=OFF"
fi

if [ "$OPENGLES_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGLES"
  KODI_OPENGLES="-DENABLE_OPENGLES=ON"
else
  KODI_OPENGLES="-DENABLE_OPENGLES=OFF"
fi

if [ "$ALSA_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET alsa-lib"
  KODI_ALSA="-DENABLE_ALSA=ON"
else
  KODI_ALSA="-DENABLE_ALSA=OFF"
fi

if [ "$PULSEAUDIO_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pulseaudio"
  KODI_PULSEAUDIO="-DENABLE_PULSEAUDIO=ON"
else
  KODI_PULSEAUDIO="-DENABLE_PULSEAUDIO=OFF"
fi

if [ "$ESPEAK_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET espeak"
fi

if [ "$CEC_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libcec"
  KODI_CEC="-DENABLE_CEC=ON"
else
  KODI_CEC="-DENABLE_CEC=OFF"
fi

if [ "$KODI_OPTICAL_SUPPORT" = yes ]; then
  KODI_OPTICAL="-DENABLE_OPTICAL=ON"
else
  KODI_OPTICAL="-DENABLE_OPTICAL=OFF"
fi

if [ "$KODI_NONFREE_SUPPORT" = yes ]; then
  KODI_NONFREE="-DENABLE_NONFREE=ON"
else
  KODI_NONFREE="-DENABLE_NONFREE=OFF"
fi

if [ "$KODI_DVDCSS_SUPPORT" = yes ]; then
  KODI_DVDCSS="-DENABLE_DVDCSS=ON \
               -DLIBDVDCSS_URL=$ROOT/$SOURCES/libdvdcss/libdvdcss-$(get_pkg_version libdvdcss).tar.gz"
else
  KODI_DVDCSS="-DENABLE_DVDCSS=OFF"
fi

if [ "$KODI_BLURAY_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libbluray"
  KODI_BLURAY="-DENABLE_BLURAY=ON"
else
  KODI_BLURAY="-DENABLE_BLURAY=OFF"
fi

if [ "$AVAHI_DAEMON" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET avahi nss-mdns"
  KODI_AVAHI="-DENABLE_AVAHI=ON"
else
  KODI_AVAHI="-DENABLE_AVAHI=OFF"
fi

if [ "$KODI_MYSQL_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mysql"
  KODI_MYSQL="-DENABLE_MYSQLCLIENT=ON"
else
  KODI_MYSQL="-DENABLE_MYSQLCLIENT=OFF"
fi

if [ "$KODI_AIRPLAY_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libplist"
  KODI_AIRPLAY="-DENABLE_PLIST=ON"
else
  KODI_AIRPLAY="-DENABLE_PLIST=OFF"
fi

if [ "$KODI_AIRTUNES_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libshairplay"
  KODI_AIRTUNES="-DENABLE_AIRTUNES=ON"
else
  KODI_AIRTUNES="-DENABLE_AIRTUNES=OFF"
fi

if [ "$KODI_NFS_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libnfs"
  KODI_NFS="-DENABLE_NFS=ON"
else
  KODI_NFS="-DENABLE_NFS=OFF"
fi

if [ "$KODI_SAMBA_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET samba"
  KODI_SAMBA="-DENABLE_SMBCLIENT=ON"
else
  KODI_SAMBA="-DENABLE_SMBCLIENT=OFF"
fi

if [ "$KODI_WEBSERVER_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libmicrohttpd"
fi

if [ "$KODI_UPNP_SUPPORT" = yes ]; then
  KODI_UPNP="-DENABLE_UPNP=ON"
else
  KODI_UPNP="-DENABLE_UPNP=OFF"
fi

if [ "$KODI_SSHLIB_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libssh"
  KODI_SSH="-DENABLE_SSH=ON"
else
  KODI_SSH="-DENABLE_SSH=OFF"
fi

if [ "$VDPAU_SUPPORT" = "yes" -a "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libvdpau"
  KODI_VDPAU="-DENABLE_VDPAU=ON"
else
  KODI_VDPAU="-DENABLE_VDPAU=OFF"
fi

if [ "$VAAPI_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libva-intel-driver"
  KODI_VAAPI="-DENABLE_VAAPI=ON"
else
  KODI_VAAPI="-DENABLE_VAAPI=OFF"
fi

if [ "$TARGET_ARCH" = "x86_64" ]; then
  KODI_ARCH="-DWITH_CPU=$TARGET_ARCH"
else
  KODI_ARCH="-DWITH_ARCH=$TARGET_ARCH"
fi

if [ ! "$KODIPLAYER_DRIVER" = default ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $KODIPLAYER_DRIVER"
  if [ "$KODIPLAYER_DRIVER" = bcm2835-driver ]; then
    KODI_PLAYER="-DENABLE_MMAL=ON -DCORE_SYSTEM_NAME=rbpi"
  elif [ "$KODIPLAYER_DRIVER" = libfslvpuwrap ]; then
    KODI_PLAYER="-DENABLE_IMX=ON"
    CFLAGS="$CFLAGS -DHAS_IMXVPU -DLINUX -DEGL_API_FB"
    CXXFLAGS="$CXXFLAGS -DHAS_IMXVPU -DLINUX -DEGL_API_FB"
  elif [ "$KODIPLAYER_DRIVER" = libamcodec ]; then
    KODI_PLAYER="-DENABLE_AML=ON"
  fi
fi

KODI_LIBDVD="$KODI_DVDCSS \
             -DLIBDVDNAV_URL=$ROOT/$SOURCES/libdvdnav/libdvdnav-$(get_pkg_version libdvdnav).tar.gz \
             -DLIBDVDREAD_URL=$ROOT/$SOURCES/libdvdread/libdvdread-$(get_pkg_version libdvdread).tar.gz"

PKG_CMAKE_OPTS_TARGET="-DNATIVEPREFIX=$ROOT/$TOOLCHAIN \
                       -DWITH_TEXTUREPACKER=$ROOT/$TOOLCHAIN/bin/TexturePacker \
                       -DDEPENDS_PATH=$ROOT/$PKG_BUILD/depends \
                       -DPYTHON_INCLUDE_DIRS=$SYSROOT_PREFIX/usr/include/python2.7 \
                       -DGIT_VERSION=$GIT_VERSION \
                       -DENABLE_INTERNAL_FFMPEG=OFF \
                       -DFFMPEG_INCLUDE_DIRS=$SYSROOT_PREFIX/usr \
                       -DENABLE_INTERNAL_CROSSGUID=OFF \
                       -DENABLE_SDL=OFF \
                       -DENABLE_OPENSSL=ON \
                       -DENABLE_UDEV=ON \
                       -DENABLE_DBUS=ON \
                       -DENABLE_XSLT=ON \
                       -DENABLE_CCACHE=ON \
                       -DENABLE_LIRC=ON \
                       -DENABLE_EVENTCLIENTS=ON \
                       -DENABLE_LDGOLD=OFF \
                       $KODI_ARCH \
                       $KODI_OPENGL \
                       $KODI_OPENGLES \
                       $KODI_OPENMAX \
                       $KODI_VDPAU \
                       $KODI_VAAPI \
                       $KODI_JOYSTICK \
                       $KODI_CEC \
                       $KODI_XORG \
                       $KODI_SAMBA \
                       $KODI_NFS \
                       $KODI_LIBDVD \
                       $KODI_AVAHI \
                       $KODI_UPNP \
                       $KODI_MYSQL \
                       $KODI_SSH \
                       $KODI_AIRPLAY \
                       $KODI_AIRTUNES \
                       $KODI_NONFREE \
                       $KODI_OPTICAL \
                       $KODI_BLURAY \
                       $KODI_PLAYER"

pre_configure_target() {
# kodi should never be built with lto
  strip_lto
  strip_gold

  export LIBS="$LIBS -lz -lterminfo"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin/kodi
  rm -rf $INSTALL/usr/bin/kodi-standalone
  rm -rf $INSTALL/usr/bin/xbmc
  rm -rf $INSTALL/usr/bin/xbmc-standalone
  rm -rf $INSTALL/usr/share/kodi/cmake
  rm -rf $INSTALL/usr/share/applications
  rm -rf $INSTALL/usr/share/icons
  rm -rf $INSTALL/usr/share/pixmaps
  rm -rf $INSTALL/usr/share/kodi/addons/skin.estouchy
  rm -rf $INSTALL/usr/share/kodi/addons/service.xbmc.versioncheck
  rm -rf $INSTALL/usr/share/kodi/addons/visualization.vortex
  rm -rf $INSTALL/usr/share/xsessions

  mv $INSTALL/usr/lib/python2.7/dist-packages $INSTALL/usr/lib/python2.7/site-packages

  mkdir -p $INSTALL/usr/lib/kodi
    cp $PKG_DIR/scripts/kodi-config $INSTALL/usr/lib/kodi
    cp $PKG_DIR/scripts/kodi.sh $INSTALL/usr/lib/kodi

  mkdir -p $INSTALL/usr/lib/alexelec
    cp $PKG_DIR/scripts/systemd-addon-wrapper $INSTALL/usr/lib/alexelec

  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/setwakeup.sh $INSTALL/usr/bin
# Android mount
    cp $PKG_DIR/scripts/nand-config.sh $INSTALL/usr/bin
# Drop RAM service
    cp $PKG_DIR/scripts/drop-ram.start $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/share/kodi/addons
    cp -R $PKG_DIR/config/os.alexelec $INSTALL/usr/share/kodi/addons
    $SED "s|@OS_VERSION@|$OS_VERSION|g" -i $INSTALL/usr/share/kodi/addons/os.alexelec/addon.xml
    cp -R $PKG_DIR/config/repository.alexelec $INSTALL/usr/share/kodi/addons
    $SED "s|@ADDON_URL@|$ADDON_URL|g" -i $INSTALL/usr/share/kodi/addons/repository.alexelec/addon.xml

# install project specific configs
  mkdir -p $INSTALL/usr/share/kodi/config
    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/guisettings.xml ]; then
      cp $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/guisettings.xml $INSTALL/usr/share/kodi/config
    elif [ -f $PROJECT_DIR/$PROJECT/kodi/guisettings.xml ]; then
      cp $PROJECT_DIR/$PROJECT/kodi/guisettings.xml $INSTALL/usr/share/kodi/config
    else
      cp $PKG_DIR/config/guisettings.xml $INSTALL/usr/share/kodi/config
    fi

    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/sources.xml ]; then
      cp $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/sources.xml $INSTALL/usr/share/kodi/config
    elif [ -f $PROJECT_DIR/$PROJECT/kodi/sources.xml ]; then
      cp $PROJECT_DIR/$PROJECT/kodi/sources.xml $INSTALL/usr/share/kodi/config
    else
      cp $PKG_DIR/config/sources.xml $INSTALL/usr/share/kodi/config
    fi

  mkdir -p $INSTALL/usr/share/kodi/system/
    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/advancedsettings.xml ]; then
      cp $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/advancedsettings.xml $INSTALL/usr/share/kodi/system/
    elif [ -f $PROJECT_DIR/$PROJECT/kodi/advancedsettings.xml ]; then
      cp $PROJECT_DIR/$PROJECT/kodi/advancedsettings.xml $INSTALL/usr/share/kodi/system/
    else
      cp $PKG_DIR/config/advancedsettings.xml $INSTALL/usr/share/kodi/system/
    fi
    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/advancedsettings.xml.sample ]; then
      cp $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/advancedsettings.xml.sample $INSTALL/usr/share/kodi/system/
    elif [ -f $PROJECT_DIR/$PROJECT/kodi/advancedsettings.xml.sample ]; then
      cp $PROJECT_DIR/$PROJECT/kodi/advancedsettings.xml.sample $INSTALL/usr/share/kodi/system/
    else
      cp $PKG_DIR/config/advancedsettings.xml.sample $INSTALL/usr/share/kodi/system/
    fi

  mkdir -p $INSTALL/usr/share/kodi/system/settings
    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/appliance.xml ]; then
      cp $PROJECT_DIR/$PROJECT/devices/$DEVICE/kodi/appliance.xml $INSTALL/usr/share/kodi/system/settings
    elif [ -f $PROJECT_DIR/$PROJECT/kodi/appliance.xml ]; then
      cp $PROJECT_DIR/$PROJECT/kodi/appliance.xml $INSTALL/usr/share/kodi/system/settings
    else
      cp $PKG_DIR/config/appliance.xml $INSTALL/usr/share/kodi/system/settings
    fi

  # update addon manifest
  ADDON_MANIFEST=$INSTALL/usr/share/kodi/system/addon-manifest.xml
  xmlstarlet ed -L -d "/addons/addon[text()='service.xbmc.versioncheck']" $ADDON_MANIFEST
  xmlstarlet ed -L -d "/addons/addon[text()='skin.estouchy']" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "os.alexelec" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "repository.alexelec" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "service.system.settings" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "service.alexelec.settings" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "resource.language.ru_ru" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "script.openweathermap.maps" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "weather.openweathermap.extended" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "script.skinshortcuts" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "skin.aeon.nox.5ae" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "repository.search.db" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "script.module.unidecode" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "script.module.simplejson" $ADDON_MANIFEST

  # more binaddons cross compile badness meh
  sed -e "s:INCLUDE_DIR /usr/include/kodi:INCLUDE_DIR $SYSROOT_PREFIX/usr/include/kodi:g" \
      -e "s:CMAKE_MODULE_PATH /usr/lib/kodi /usr/share/kodi/cmake:CMAKE_MODULE_PATH $SYSROOT_PREFIX/usr/share/kodi/cmake:g" \
      -i $SYSROOT_PREFIX/usr/share/kodi/cmake/KodiConfig.cmake

  if [ "$KODI_EXTRA_FONTS" = yes ]; then
      mkdir -p $INSTALL/usr/share/kodi/media/Fonts
      cp $PKG_DIR/fonts/*.ttf $INSTALL/usr/share/kodi/media/Fonts
  fi

  # install AlexELEC addons
  if [ -f $PKG_DIR/config/addons-alexelec/plugins.tbz2 ]; then
      mkdir -p $INSTALL/usr/share/kodi/config/addons-alexelec
      cp $PKG_DIR/config/addons-alexelec/plugins.tbz2 $INSTALL/usr/share/kodi/config/addons-alexelec
  fi

# install addons config
  if [ -d $PKG_DIR/config/weather.openweathermap.extended ]; then
      cp -R $PKG_DIR/config/weather.openweathermap.extended $INSTALL/usr/share/kodi/config
  fi

  if [ -d $PKG_DIR/config/script.skinshortcuts ]; then
      cp -R $PKG_DIR/config/script.skinshortcuts $INSTALL/usr/share/kodi/config
  fi

  if [ -d $PKG_DIR/config/skin.aeon.nox.5ae ]; then
      cp -R $PKG_DIR/config/skin.aeon.nox.5ae $INSTALL/usr/share/kodi/config
  fi

  debug_strip $INSTALL/usr/lib/kodi/kodi.bin
}

post_install() {
  # link default.target to kodi.target
  ln -sf kodi.target $INSTALL/usr/lib/systemd/system/default.target

  # enable default services
  enable_service kodi-autostart.service
  enable_service kodi-cleanlogs.service
  enable_service kodi-halt.service
  enable_service kodi-poweroff.service
  enable_service kodi-reboot.service
  enable_service kodi-waitonnetwork.service
  enable_service kodi.service
  enable_service kodi-lirc-suspend.service
# Android mount service
  enable_service nand-config.service
  enable_service storage-nand.mount
# GUI switch service
  enable_service gui-switch.service
# Drop RAM service
  enable_service drop-ram.service
}
