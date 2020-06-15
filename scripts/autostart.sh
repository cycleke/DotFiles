#!/bin/bash

xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x493 --rotate normal --output HDMI-1 --mode 1920x1200 --pos 1920x0 --rotate left --output DP-1 --off --output HDMI-2 --off
# xrandr --dpi 128 --output eDP-1 --primary --mode 1920x1080 --pos 0x420 --rotate normal --output HDMI-1 --mode 1920x1200 --pos 1920x0 --rotate left --output DP-1 --off --output HDMI-2 --off
/bin/bash ~/scripts/dwm-status.sh &
/bin/bash ~/scripts/wp-autochange.sh &
# picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
picom -b
/bin/bash ~/scripts/tap-to-click.sh &
/bin/bash ~/scripts/inverse-scroll.sh &
# nm-applet &
xfce4-power-manager &
# xfce4-volumed-pulse &
fcitx &
redshift &
clash &
nohup /usr/bin/nutstore >/dev/null 2>&1 &
~/scripts/autostart_wait.sh &
