#! /bin/bash

# Install dependencies

# DO NOT RUN INDIVIDUALLY!

yay -S $(cat "$1/packages.txt")
