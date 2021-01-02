#!/usr/bin/sh
export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS
gsettings set org.gnome.desktop.interface gtk-theme Mojave-light
gsettings set org.gnome.desktop.interface icon-theme McMojave-circle-green
alacritty-theme-switch -s papercolor_light.yaml
