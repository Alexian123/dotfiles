#!/bin/bash

# Initializes directories from $HOME

# .config
mkdir ~/.config/nvim -p
mkdir ~/.config/i3
mkdir ~/.config/i3blocks
mkdir ~/.config/qtile
mkdir ~/.config/openbox
mkdir ~/.config/ranger
mkdir ~/.config/gxkb
mkdir ~/.config/tint2
mkdir ~/.config/codeblocks

# .cache
mkdir ~/.cache/nvim/undodir -p

# .local
mkdir ~/.local/bin -p
mkdir ~/.local/share/applications -p
mkdir ~/.local/share/fonts

# .screenlayout
mkdir ~/.screenlayout

# Projects
mkdir ~/Projects/CodeBlocks -p
mkdir ~/Projects/Eclipse
mkdir ~/Projects/VSCode

# Source
mkdir ~/Source/personal/dotfiles -p

# VMs
mkdir ~/VirtManager\ VMs
mkdir ~/VirtualBox\ VMs
