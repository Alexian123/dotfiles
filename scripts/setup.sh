#!/bin/bash

# Sets up home dir and links dotfiles

./init_home_dir.sh
cp -r ../* $HOME/Source/personal/dotfiles/
./deploy_dotfiles.sh

