#!/bin/bash

#xrandr --output eDP1 --primary --mode 1600x900 --pos 1200x952 --rotate normal --output DP1 --off --output HDMI1 --mode 1920x1200 --pos 0x0 --rotate left --output HDMI2 --off --output VIRTUAL1 --off
# xrandr --output eDP1 --off --output DP1 --off --output HDMI1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off
/bin/bash -c "sleep 15 && python3 ~/scripts/auto_switch.py " &
/bin/bash ~/scripts/dwm-status.sh &5
/bin/bash ~/scripts/wp-autochange.sh &
picom -b
/bin/bash ~/scripts/tap-to-click.sh &
/bin/bash ~/scripts/inverse-scroll.sh &
xfce4-power-manager &
# xfce4-volumed-pulse &
redshift &
clash &
nohup /usr/bin/nutstore >/dev/null 2>&1 &
nm-applet &
albert &
fcitx5 &
~/scripts/autostart_wait.sh &
