#! /bin/bash

# Deploy Arch system

# DO NOT RUN INDIVIDUALLY!

# get full path of this script
FILE_PATH="$(readlink -f "$0")"

# get the parent dir of this script
SCRIPTS_DIR="$(dirname "$FILE_PATH")"

# get the parent of the deploy_scripts dir (aka the scripts di
DOTFILES_DIR="$(dirname "$SCRIPTS_DIR")"
# get the parent of scripts dir (aka the main dir)
DOTFILES_DIR="$(dirname "$DOTFILES_DIR")"

# install yay (rquires git and base-devel)
mkdir $HOME/.cache && cd $HOME/.cache
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

# $HOME config
$DOTFILES_DIR/scripts/deploy_system/home.sh $DOTFILES_DIR

# System config
sudo $DOTFILES_DIR/scripts/deploy_system/system.sh $DOTFILES_DIR

# Dependencies
$DOTFILES_DIR/scripts/deploy_system/deps.sh $DOTFILES_DIR
