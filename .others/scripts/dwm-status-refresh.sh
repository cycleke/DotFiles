#!/bin/bash

print_mem(){
	memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	swapfree=$(($(grep -m1 'SwapFree:' /proc/meminfo | awk '{print $2}') / 1024))
  echo -e "${memfree}M | ${swapfree}M"
}

print_temp(){
  test -f /sys/class/thermal/thermal_zone0/temp || return 0
  echo $(head -c 2 /sys/class/thermal/thermal_zone0/temp)℃
}

print_date(){
  date '+%Y年%m月%d日 周%a %H:%M:%S'
}

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"

#. "$DIR/dwmbar-functions/dwm_transmission.sh"
#. "$DIR/dwmbar-functions/dwm_cmus.sh"
# . "$DIR/dwmbar-functions/dwm_resources.sh"
. "$DIR/dwmbar-functions/dwm_battery.sh"
#. "$DIR/dwmbar-functions/dwm_mail.sh"
. "$DIR/dwmbar-functions/dwm_backlight.sh"
. "$DIR/dwmbar-functions/dwm_alsa.sh"
#. "$DIR/dwmbar-functions/dwm_pulse.sh"
# . "$DIR/dwmbar-functions/dwm_weather.sh"
#. "$DIR/dwmbar-functions/dwm_vpn.sh"
#. "$DIR/dwmbar-functions/dwm_network.sh"
#. "$DIR/dwmbar-functions/dwm_keyboard.sh"
#. "$DIR/dwmbar-functions/dwm_ccurse.sh"
#. "$DIR/dwmbar-functions/dwm_date.sh"

xsetroot -name "💿$(print_mem) $(dwm_alsa) [$(dwm_battery), $(dwm_backlight)] $(print_date)"

exit 0
