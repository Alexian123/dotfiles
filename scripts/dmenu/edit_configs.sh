#!/bin/bash

# Open most oftenly edited config files

EDIT_CMD="$TERMINAL -e /usr/bin/nvim"
OPTIONS="i3\ni3blocks\nqtile\nqtile_autostart\nopenbox\nopenbox_autostart\nzsh\nprofile\nnvim"

CHOICE=$(echo -e $OPTIONS | dmenu -i -p "Edit Config" -fn "MesloLGS NF:pixelsize=18" -sb "#A4412D")

case $CHOICE in

    "i3")
        $EDIT_CMD ~/.config/i3/config
        ;;

    "i3blocks")
        $EDIT_CMD ~/.config/i3blocks/config
        ;;

    "qtile")
        $EDIT_CMD ~/.config/qtile/config.py
        ;;

    "qtile_autostart")
        $EDIT_CMD ~/.config/qtile/autostart.sh
        ;;

    "openbox")
        $EDIT_CMD ~/.config/openbox/rc.xml
        ;;

    "openbox_autostart")
        $EDIT_CMD ~/.config/openbox/autostart
        ;;

    "zsh")
        $EDIT_CMD ~/.zshrc
        ;;

    "profile")
        $EDIT_CMD ~/.profile
        ;;

    "nvim")
        $EDIT_CMD ~/.config/nvim/init.vim
        ;;

esac
