#!/bin/sh
xrdb -merge ~/.Xresources &
nm-applet &
picom -f &
blueman-applet &
nitrogen --restore &
pasystray &
