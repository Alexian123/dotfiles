#!/bin/bash

# poweroff or restart the computer

OPTIONS="Lock Screen\nPower Off\nReboot"
LOCK_CMD="i3lock-fancy-multimonitor"

CHOICE=$(echo -e $OPTIONS | dmenu -bw 3 -h 20 -i -p "Power Menu")

case $CHOICE in

    "Lock Screen")
        $LOCK_CMD
        ;;

    "Power Off")
        poweroff
        ;;

    "Reboot")
        reboot
        ;;

esac
