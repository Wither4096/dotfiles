#!/bin/bash

#Installs common gaming platforms

sudo pacman -S steam xdg-desktop-portal-gtk xdg-desktop-portal #ttf-liberation
sudo pacman -S  lib32-nvidia-utils lib32-vulkan-icd-loader glu gst-libav lib32-acl lib32-attr lib32-dbus lib32-fontconfig lib32-freetype2 lib32-gettext lib32-glib2 lib32-glu lib32-harfbuzz lib32-lcms2 lib32-libcap lib32-libgcrypt lib32-libice lib32-libjpeg-turbo lib32-libnl lib32-libpcap lib32-libpng lib32-libsm lib32-libtiff lib32-libtirpc lib32-libxcursor lib32-libxi lib32-libxrandr lib32-libxrender lib32-pam lib32-pcre lib32-sdl2 lib32-systemd lib32-util-linux # 32 Bit libs
yay -S gamemode lib32-gamemode heroic-games-launcher-bin prismlauncher-qt5-bin
