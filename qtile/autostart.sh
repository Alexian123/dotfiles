#!/bin/sh
xrdb -merge '~/.Xresources' &
nitrogen --restore &
picom -cf --inactive-opacity=1.0 --menu-opacity=1.0 &
nm-applet &
blueman-tray &
pa-applet &
caffeine &
xfce4-power-manager &
redshift-gtk &
gxkb &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
xss-lock -l i3lock-fancy-multimonitor &
udiskie -t &
