#!/usr/bin/sh
export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS
gsettings set org.gnome.desktop.interface gtk-theme Mojave-dark
gsettings set org.gnome.desktop.interface icon-theme McMojave-circle-green-dark
alacritty-theme-switch -s one_dark.yaml
