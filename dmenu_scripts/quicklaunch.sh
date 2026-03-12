#!/bin/bash

# Simple dmenu prompt for launching programs

OPTIONS="Web Browser\nFile Manager\nText Editor\nSystem Monitor"

CHOICE=$(echo -e $OPTIONS | $DMENU -l 4 -i -p "Quick Launch")

case $CHOICE in

    "Web Browser")
        $WEB_BROWSER
        ;;

    "File Manager")
        $GUI_FILE_MANAGER
        ;;

    "Text Editor")
        $GEDITOR
        ;;

    "System Monitor")
        $TERMINAL -e $SYS_MONITOR
        ;;

esac

exit 0
