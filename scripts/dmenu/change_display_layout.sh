#!/bin/bash

# Simple dmenu prompt for launching programs

OPTIONS="Laptop Only\nExtend Right\nExternal Only\nFix Wallpaper"

CHOICE=$(echo -e $OPTIONS | dmenu -i -p "Display layouts: " -fn "MesloLGS NF" -sb "#A4412D")

case $CHOICE in

    "Laptop Only")
        display_layout0
        ;;

    "Extend Right")
        display_layout1
        ;;

    "External Only")
        display_layout2
        ;;

    "Fix Wallpaper")
        reset_wallpaper
        ;;

esac
