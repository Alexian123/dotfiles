#! /bin/bash

# Install dependencies

# DO NOT RUN INDIVIDUALLY!

echo "Refreshing repos and updating system..." && sleep 1
yay -Syyu && echo "Done."

echo "Installing dependencies..." && sleep 1
yay -S $(cat "$1/packages.txt") && echo "Done."
