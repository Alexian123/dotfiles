#!/bin/sh
xrdb -merge ~/.Xresources &
nitrogen --restore &
picom &
nm-applet &
blueman-applet &
pasystray &
