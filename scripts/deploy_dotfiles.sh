# !/bin/bash

# Symlink dotfiles and create required dirs in $HOME

# DO NOT RUN INDIVIDUALLY!

DOTFILES_DIR="$HOME/Documents/dotfiles"

# link $HOME dotfiles
echo "Making \$HOME symlinks..." && sleep 2
ln -sfv $DOTFILES_DIR/home/.aliasrc $HOME/
ln -sfv $DOTFILES_DIR/home/.bashrc $HOME/
ln -sfv $DOTFILES_DIR/home/.profile $HOME/
ln -sfv $DOTFILES_DIR/home/.vimrc $HOME/
ln -sfv $DOTFILES_DIR/home/.Xresources $HOME/
ln -sfv $DOTFILES_DIR/home/.zshrc $HOME/
ln -sfv $DOTFILES_DIR/home/.gtkrc-2.0 $HOME/
echo "Done."


# link ~/.config dotfiles
echo "Making \$HOME/.config symlinks..." && sleep 2
if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
    echo "Created config dir."
fi

ln -sfv $DOTFILES_DIR/config/nvim ~/.config/
ln -sfv $DOTFILES_DIR/config/alacritty ~/.config/
ln -sfv $DOTFILES_DIR/config/awesome ~/.config/
ln -sfv $DOTFILES_DIR/config/codeblocks ~/.config/
ln -sfv $DOTFILES_DIR/config/htop ~/.config/
ln -sfv $DOTFILES_DIR/config/picom.conf ~/.config/
ln -sfv $DOTFILES_DIR/config/starship.toml ~/.config/
ln -sfv $DOTFILES_DIR/config/volumeicon ~/.config/
ln -sfv $DOTFILES_DIR/config/gtk-2.0 ~/.config/
ln -sfv $DOTFILES_DIR/config/gtk-3.0 ~/.config/
echo "Done."


# link ~/.local/bin
echo "Making \$HOME/.local/bin symlinks..." && sleep 2
if [ ! -d "$HOME/.local/bin" ]; then
    mkdir $HOME/.local/bin -p
    echo "Created home bin dir."
fi

ln -sfv $DOTFILES_DIR/scripts/detect_monitors.sh ~/.local/bin/detect_monitors
ln -sfv $DOTFILES_DIR/scripts/launch_volumeicon.sh ~/.local/bin/launch_volumeicon
ln -sfv $DOTFILES_DIR/scripts/power_options.sh ~/.local/bin/power_options
ln -sfv $DOTFILES_DIR/scripts/quicklaunch.sh ~/.local/bin/quicklaunch
ln -sfv $DOTFILES_DIR/scripts/open_files.sh ~/.local/bin/open_files
echo "Done."


# link ~/.screenlayout
echo "Making \$HOME/.screenlayout symlinks..." && sleep 2
if [ ! -d "$HOME/.screenlayout" ]; then
    mkdir $HOME/.screenlayout
    echo "Created screenlayout dir."
fi

ln -sfv $DOTFILES_DIR/scripts/xrandr/default.sh ~/.screenlayout/
ln -sfv $DOTFILES_DIR/scripts/xrandr/extend_right.sh ~/.screenlayout/
ln -sfv $DOTFILES_DIR/scripts/xrandr/extend_right_and_top.sh ~/.screenlayout/
echo "Done."


# create undodir for nvim/vim
if [ ! -d "$HOME/.vim/undodir" ]; then
    mkdir $HOME/.vim/undodir -p
    echo "Created vim undodir"
fi

if [ ! -d "$HOME/.cache/nvim/undodir" ]; then
    mkdir $HOME/.cache/nvim/undodir -p
    echo "Created nvim undodir."
fi


# create screenshots dir 
if [ ! -d "$HOME/Pictures/screenshots" ]; then
    mkdir $HOME/Pictures/screenshots -p
    echo "Created screenshots dir"
fi
