#!/bin/bash

xrandr --output eDP1 --primary --mode 1920x1080 --pos 1200x716 --rotate normal --output HDMI1 --mode 1920x1200 --pos 0x0 --rotate left --output DP1 --off --output HDMI2 --off
/bin/bash ~/scripts/dwm-status.sh &5
/bin/bash ~/scripts/wp-autochange.sh &
picom -b
/bin/bash ~/scripts/tap-to-click.sh &
/bin/bash ~/scripts/inverse-scroll.sh &
xfce4-power-manager &
# xfce4-volumed-pulse &
redshift &
nohup /usr/bin/nutstore >/dev/null 2>&1 &
nm-applet &
fcitx5 &
~/scripts/autostart_wait.sh &
