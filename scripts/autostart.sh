#!/bin/bash

#/bin/bash -c "python3 ~/scripts/auto_switch.py " &

# xrandr --newmode "1440x810" 5.00 1440 1520 1664 1888  810 813 818 841 -hsync +vsync
# xrandr --addmode eDP1 1440x810
# xrandr --output eDP1 --primary --mode 1440x810 --pos 1200x952 --rotate normal --output DP1 --off --output HDMI1 --mode 1920x1200 --pos 0x0 --rotate left --output HDMI2 --off --output VIRTUAL1 --off

# xrandr --output eDP1 --mode 1920x1080 --pos 0x1200 --rotate normal --output DP1 --off --output HDMI1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI2 --off --output VIRTUAL1 --off
# xrandr --output eDP1 --primary --mode 1920x1080 --pos 1200x716 --rotate normal --output DP1 --off --output HDMI1 --mode 1920x1200 --pos 0x0 --rotate left --output HDMI2 --off --output VIRTUAL1 --off
xrandr --output eDP1 --mode 1920x1080 --pos 1200x799 --rotate normal --output DP1 --off --output HDMI1 --primary --mode 1920x1200 --pos 0x0 --rotate left --output HDMI2 --off --output VIRTUAL1 --off

/bin/bash ~/scripts/wp-autochange.sh &
/bin/bash ~/scripts/dwm-status.sh &5
/bin/bash ~/scripts/tap-to-click.sh &
/bin/bash ~/scripts/inverse-scroll.sh &
picom -b --config ~/.picom.conf &
xfce4-power-manager &
# xfce4-volumed-pulse &
redshift &
# clash &
nohup /usr/bin/nutstore >/dev/null 2>&1 &
# nohup /usr/lib/gsd-xsettings > /dev/null 2>&1 &
nm-applet &
# albert &
fcitx5 &
dunst &
~/scripts/autostart_wait.sh &
xautolock -time 30 -locker ~/scripts/lock.sh -detectsleep &
