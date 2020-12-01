#!/bin/bash

# Sets up home dir and links dotfiles

./scripts/init_home_dir.sh
cp -r ./* $HOME/Source/personal/dotfiles/
./scripts/deploy_dotfiles.sh
