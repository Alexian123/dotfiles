#!/bin/bash

DOTFILES=$HOME/Source/personal/dotfiles

# screen layout
ln -sf $DOTFILES/screenlayout/layout0.sh ~/.screenlayout/default
ln -sf $DOTFILES/screenlayout/layout0.sh ~/.screenlayout/
ln -sf $DOTFILES/screenlayout/layout2.sh ~/.screenlayout/
ln -sf $DOTFILES/screenlayout/layout1.sh ~/.screenlayout/

# bash
ln -sf $DOTFILES/bash/.bashrc ~/
ln -sf $DOTFILES/bash/.profile ~/

# zsh
ln -sf $DOTFILES/zsh/.zshrc ~/
ln -sf ~/.profile ~/.zprofile
ln -sf $DOTFILES/zsh/.p10k.zsh ~/

# Xresources
ln -sf $DOTFILES/x/.Xresources ~/

# gtk theme
ln -sf $DOTFILES/gtk-2.0/gtkfilechooser.ini ~/.config/gtk-2.0/
ln -sf $DOTFILES/gtk-3.0/settings.ini ~/.config/gtk-3.0/

# qt theme
ln -sf $DOTFILES/qt5ct/qt5ct.conf ~/.config/qt5ct/

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

# tint2
ln -sf $DOTFILES/tint2/tint2rc ~/.config/tint2/

# gxkb
ln -sf $DOTFILES/gxkb/gxkb.cfg ~/.config/gxkb/

# neovim
ln -sf $DOTFILES/nvim/init.vim ~/.config/nvim

# ranger
ln -sf $DOTFILES/ranger/plugins ~/.config/ranger/
ln -sf $DOTFILES/ranger/commands.py ~/.config/ranger/
ln -sf $DOTFILES/ranger/commands_full.py ~/.config/ranger/
ln -sf $DOTFILES/ranger/rc.conf ~/.config/ranger/
ln -sf $DOTFILES/ranger/rifle.conf ~/.config/ranger/
ln -sf $DOTFILES/ranger/scope.sh ~/.config/ranger/

# alacritty
ln -sf $DOTFILES/alacritty/alacritty.yml ~/.config/alacritty/

# .local/bin
ln -sf $DOTFILES/scripts/webcam ~/.local/bin/
ln -sf $DOTFILES/scripts/reset_wallpaper ~/.local/bin/
ln -sf $DOTFILES/scripts/dmenu/power_options.sh ~/.local/bin/power_options
ln -sf $DOTFILES/scripts/dmenu/edit_configs.sh ~/.local/bin/edit_configs
ln -sf $DOTFILES/scripts/sync_dotfiles.sh ~/.local/bin/sync_dotfiles
ln -sf $DOTFILES/screenlayout/layout0.sh ~/.local/bin/display_layout0
ln -sf $DOTFILES/screenlayout/layout1.sh ~/.local/bin/display_layout1
ln -sf $DOTFILES/screenlayout/layout2.sh ~/.local/bin/display_layout2

# .local/share
ln -sf $DOTFILES/launchers/st.desktop ~/.local/share/applications/
ln -sf $DOTFILES/launchers/ob_menu.desktop ~/.local/share/applications/
ln -sf $DOTFILES/fonts/MesloLGS\ NF\ Regular.ttf ~/.local/share/fonts/
ln -sf $DOTFILES/fonts/MesloLGS\ NF\ Bold.ttf ~/.local/share/fonts/
ln -sf $DOTFILES/fonts/MesloLGS\ NF\ Italic.ttf ~/.local/share/fonts/
ln -sf $DOTFILES/fonts/MesloLGS\ NF\ Bold\ Italic.ttf ~/.local/share/fonts/

# scripts dir
ln -sf $DOTFILES/scripts ~/Projects/
