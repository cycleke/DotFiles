#!/usr/bin/env python3

import time, subprocess, os

# --- set your internal screen below (the example is my primary screen)
INTERNAL = "eDP1"

scr_info1 = 0


def add_hidpi_mode():
    if (os.system(
            'xrandr --newmode "1440x810" 5.00 1440 1520 1664 1888  810 813 818 841 -hsync +vsync'
    ) == 0):
        os.system("xrandr --addmode " + INTERNAL + " 1440x810")
        os.system("xrandr --output " + INTERNAL + " --mode 1440x810")


def auto_switch_screen():
    # read the current screen setup from xrandr
    get_screens = subprocess.check_output("xrandr").decode(
        "utf-8").splitlines()
    scr_data = [l for l in get_screens if " connected " in l]
    # count the number of connected screens
    scr_info2 = len(scr_data)
    # if the number of connected screens changes,
    # switch off the INTERNAL one if there are two screens
    global scr_info1
    if scr_info2 != scr_info1:
        print(scr_data)
        if scr_info2 == 2:
            ext = [s.split()[0] for s in scr_data if not INTERNAL in s][0]
            subprocess.Popen([
                "xrandr",
                "--output",
                INTERNAL,
                "--off",
                "--output",
                ext,
                "--primary",
                "--mode",
                "1920x1200",
                "--pos",
                "0x0",
                "--rotate",
                "normal",
            ])
        elif scr_info2 == 1:
            subprocess.Popen(
                ["xrandr", "--output", INTERNAL, "--mode", "1440x810"])
    scr_info1 = scr_info2


add_hidpi_mode()
while True:
    try:
        auto_switch_screen()
        time.sleep(4)
    except KeyboardInterrupt:
        exit(0)
