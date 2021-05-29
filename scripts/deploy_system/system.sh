#! /bin/bash

# Stuff which requires root access

# DO NOT RUN INDIVIDUALLY!

# synaptics touchpad
echo "Installing synaptics config..." && sleep 2
if [ ! -d "/etc/X11/xorg.conf.d" ]; then
    mkdir /etc/X11/xorg.conf.d -p
    echo "Created xorg conf dir."
fi
cp $1/system/70-synaptics.conf /etc/X11/xorg.conf.d/
echo "Done."

# lightdm + gtk greeter
echo "Installing lightdm and gtk greeter configs..." && sleep 2
if [ ! -d "/etc/lightdm" ]; then
    mkdir /etc/lightdm
    echo "Created lightdm conf dir."
fi
cp $1/system/lightdm.conf /etc/lightdm/
cp $1/system/lightdm-gtk-greeter.conf /etc/lightdm/
echo "Done."

# vimrc for root user
echo "Installing vimrc for root user..." && sleep 1
cp $1/home/.vimrc /root/
echo "Done."

# pacman config
echo "Installing pacman config..." && sleep 1
cp $1/system/pacman.conf /etc/
echo "Done."
