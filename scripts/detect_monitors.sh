#! /bin/sh

monitor=$(xrandr -q | grep 'DP-2' | awk '{print $2}')
tv=$(xrandr -q | grep 'DP-1-1' | awk '{print $2}')

if [ "$tv" = "connected" ] && [ "$monitor" = "connected" ]
then
    ~/.screenlayout/extend_right_and_top.sh
elif [ "$monitor" = "connected" ]
then
    ~/.screenlayout/extend_right.sh
else
    ~/.screenlayout/default.sh
fi

exit 0
