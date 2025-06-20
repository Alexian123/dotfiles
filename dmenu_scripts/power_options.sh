#!/bin/bash

# poweroff or restart the computer

OPTIONS="Lock Screen\nPower Off\nReboot"
LOCK_CMD="i3lock-fancy"

CHOICE=$(echo -e $OPTIONS | dmenu -i -p "Power Menu")

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

exit 0
