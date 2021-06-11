#!/bin/bash

# Simple dmenu prompt for launching programs

BROWSER=brave
EMAIL=thunderbird
FILE_MANAGER=pcmanfm
EDITOR=notepadqq
MONITOR="$TERMINAL -e htop"

OPTIONS="Web Browser\nEmail Client\nFile Manager\nText Editor\nSystem Monitor"

CHOICE=$(echo -e $OPTIONS | dmenu -c -bw 3 -b -l 10 -i -p "Quick Launch")

case $CHOICE in

    "Web Browser")
        $BROWSER
        ;;

    "Email Client")
        $EMAIL
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
