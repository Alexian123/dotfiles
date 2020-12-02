#!/bin/bash

echo "Enter your password when asked and always go with the default selection!"
git clone https://aur.archlinux.org/yay ~/Downloads/yay
cd ~/Downloads/yay
makepkg -si
yay -S $(grep . ./package_list.txt | grep -v "^#")
