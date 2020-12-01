#!/bin/bash

DOTFILES=$HOME/Source/personal/dotfiles

# screen layout
ln -sf $DOTFILES/screenlayout/single_display.sh ~/.screenlayout/default
ln -sf $DOTFILES/screenlayout/single_display.sh ~/.screenlayout/
ln -sf $DOTFILES/screenlayout/single_external_display.sh ~/.screenlayout/
ln -sf $DOTFILES/screenlayout/extend_right.sh ~/.screenlayout/

# bash
ln -sf $DOTFILES/bash/.bashrc ~/
ln -sf $DOTFILES/bash/.bash_profile ~/

# zsh
ln -sf $DOTFILES/zsh/.zshrc ~/
ln -sf ~/.bash_profile ~/.zprofile
ln -sf $DOTFILES/zsh/.p10k.zsh ~/

# Xresources
ln -sf $DOTFILES/x/.Xresources ~/

# CodeBlocks
ln -sf $DOTFILES/codeblocks/default.conf ~/.config/codeblocks/

# i3
ln -sf $DOTFILES/i3/config ~/.config/i3/

# i3blocks
ln -sf $DOTFILES/i3blocks/config ~/.config/i3blocks/

# qtile
ln -sf $DOTFILES/qtile/config.py ~/.config/qtile/
ln -sf $DOTFILES/qtile/autostart.sh ~/.config/qtile/

# openbox
ln -sf $DOTFILES/openbox/rc.xml ~/.config/openbox/
ln -sf $DOTFILES/openbox/autostart ~/.config/openbox/
mmaker -v OpenBox3

# tint2
ln -sf $DOTFILES/tint2/tint2rc ~/.config/tint2/

# gxkb
ln -sf $DOTFILES/gxkb/gxkb.cfg ~/.config/gxkb/

# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -sf $DOTFILES/nvim/init.vim ~/.config/nvim

# ranger
ln -sf $DOTFILES/ranger/plugins ~/.config/ranger/
ln -sf $DOTFILES/ranger/commands.py ~/.config/ranger/
ln -sf $DOTFILES/ranger/commands_full.py ~/.config/ranger/
ln -sf $DOTFILES/ranger/rc.conf ~/.config/ranger/
ln -sf $DOTFILES/ranger/rifle.conf ~/.config/ranger/
ln -sf $DOTFILES/ranger/scope.sh ~/.config/ranger/

# .local/bin
ln -sf $DOTFILES/scripts/webcam ~/.local/bin/
ln -sf $DOTFILES/scripts/reset_wallpaper ~/.local/bin/
ln -sf $DOTFILES/screenlayout/single_display.sh ~/.local/bin/
ln -sf $DOTFILES/screenlayout/single_external_display.sh ~/.local/bin/
ln -sf $DOTFILES/screenlayout/extend_right.sh ~/.local/bin/
