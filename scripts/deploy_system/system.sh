#! /bin/bash

# Stuff which requires root access

# DO NOT RUN INDIVIDUALLY!

# synaptics touchpad
cp $1/system/70-synaptics.conf /etc/X11/xorg.conf.d/

# lightdm + gtk greeter
cp $1/system/lightdm.conf /etc/lightdm/
cp $1/system/lightdm-gtk-greeter.conf /etc/lightdm/

# vimrc for root user
cp $1/home/.vimrc /root/

# add personal repo
echo -e "\n" >> /etc/pacman.conf
echo "[arch-repo]" >> /etc/pacman.conf
echo "SigLevel = Optional DatabaseOptional" >> /etc/pacman.conf
echo "Server = https://gitlab.com/Alexian123/\$repo/-/raw/main/\$arch" >> /etc/pacman.conf
