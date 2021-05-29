#! /bin/bash

# Stuff which requires root access

# DO NOT RUN INDIVIDUALLY!

# synaptics touchpad
if [ ! -d "/etc/X11/xorg.conf.d" ]; then
    mkdir /etc/X11/xorg.conf.d -p
    echo "Created xorg conf dir."
fi
cp $1/system/70-synaptics.conf /etc/X11/xorg.conf.d/

# lightdm + gtk greeter
if [ ! -d "/etc/lightdm" ]; then
    mkdir /etc/lightdm
    echo "Created lightdm conf dir."
fi
cp $1/system/lightdm.conf /etc/lightdm/
cp $1/system/lightdm-gtk-greeter.conf /etc/lightdm/

# vimrc for root user
cp $1/home/.vimrc /root/

# pacman config
cp $1/system/pacman.conf /etc/
