#!/bin/bash

# poweroff or restart the computer

OPTIONS="Power Off\nReboot"

CHOICE=$(echo -e $OPTIONS | dmenu -b -i -p "Power Menu" -fn "MesloLFS NF" -sb "#A4412D")

case $CHOICE in

    "Power Off")
        poweroff
        ;;

    "Reboot")
        reboot
        ;;

esac
