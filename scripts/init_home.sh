#!/bin/bash

# Initializes directories from $HOME

# .config
mkdir ~/.config/nvim
mkdir ~/.config/i3
mkdir ~/.config/i3blocks
mkdir ~/.config/qtile
mkdir ~/.config/openbox
mkdir ~/.config/ranger
mkdir ~/.config/gxkb
mkdir ~/.config/tint2

# .cache
mkdir ~/.cache/nvim/undodir -p

# Projects
mkdir ~/Projects/CodeBlocks -p
mkdir ~/Projects/Eclipse
mkdir ~/Projects/VSCode

# Source
mkdir ~/Source/personal -p
