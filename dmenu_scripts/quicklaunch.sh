#!/bin/bash

# Simple dmenu prompt for launching programs

BROWSER=abrowser
FILE_MANAGER=pcmanfm
EDITOR=mousepad
MONITOR="$TERMINAL -e htop"

OPTIONS="Web Browser\nFile Manager\nText Editor\nSystem Monitor"

CHOICE=$(echo -e $OPTIONS | dmenu -b -l 10 -i -p "Quick Launch")

case $CHOICE in

    "Web Browser")
        $BROWSER
        ;;

    "File Manager")
        $FILE_MANAGER
        ;;

    "Text Editor")
        $EDITOR
        ;;

    "System Monitor")
        $MONITOR
        ;;

esac

exit 0
