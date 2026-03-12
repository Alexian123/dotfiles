#!/bin/bash

# poweroff or restart the computer

OPTIONS="Lock Screen\nPower Off\nReboot"

CHOICE=$(echo -e $OPTIONS | $DMENU -l 3 -i -p "Power Menu")

case $CHOICE in

    "Lock Screen")
        $XSS_LOCK_SCREEN
        ;;

    "Power Off")
        poweroff
        ;;

    "Reboot")
        reboot
        ;;

esac

exit 0
