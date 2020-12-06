#!/bin/bash

# Simple dmenu prompt for launching programs

OPTIONS="Laptop Only\nExtend Right\nExternal Only"

CHOICE=$(echo -e $OPTIONS | dmenu -i -p "Display layouts: " -fn "MesloLGS NF:pixelsize=18" -sb "#A4412D")

case $CHOICE in

    "Laptop Only")
        display_layout0 && reset_wallpaper
        ;;

    "Extend Right")
        display_layout1 && reset_wallpaper
        ;;

    "External Only")
        display_layout2 && reset_wallpaper
        ;;

esac
