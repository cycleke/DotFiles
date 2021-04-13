#!/bin/bash

cd ~/scripts
/bin/bash ~/scripts/wp-autochange.sh &
/bin/bash ~/scripts/dwm-status.sh &
/bin/bash ~/scripts/tap-to-click.sh &
/bin/bash ~/scripts/inverse-scroll.sh &
/bin/bash ~/scripts/autostart_wait.sh &

wmname LG3D &
autorandr -c &
redshift &
xfce4-power-manager &
picom -b --config ~/.picom.conf &
fcitx5 &
nm-applet &
clash &
dunst &
nohup /usr/bin/nutstore >/dev/null 2>&1 &
xss-lock ~/scripts/lock.sh &
