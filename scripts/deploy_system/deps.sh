#! /bin/bash

# Install dependencies

# DO NOT RUN INDIVIDUALLY!

yay -Syyu
yay -S $(cat "$1/packages.txt")
