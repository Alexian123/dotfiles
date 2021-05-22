#!/bin/bash

# poweroff or restart the computer

OPTIONS="Lock Screen\nPower Off\nReboot"
LOCK_CMD="i3lock-fancy-multimonitor"

CHOICE=$(echo -e $OPTIONS | dmenu -b -i -p "Power Menu" -fn "Droid Sans Mono" -sb "#A4412D")

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
