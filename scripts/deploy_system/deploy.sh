#! /bin/bash

# Deploy system

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
echo "Installing yay..." && sleep 2
if [ ! -d "$HOME/.cache" ]; then
    mkdir $HOME/.cache
    echo "Created .cache dir."
fi
cd $HOME/.cache
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && echo "Done."

# $HOME config
$DOTFILES_DIR/scripts/deploy_system/home.sh $DOTFILES_DIR

# system config
sudo $DOTFILES_DIR/scripts/deploy_system/system.sh $DOTFILES_DIR

# sependencies
$DOTFILES_DIR/scripts/deploy_system/deps.sh $DOTFILES_DIR

# post-install
$DOTFILES_DIR/scripts/deploy_system/post.sh
