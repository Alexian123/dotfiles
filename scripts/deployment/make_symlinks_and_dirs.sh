# !/bin/sh

# Symlink dotfiles and create required dirs in $HOME

DOTFILES_DIR="$HOME/Documents/dotfiles"

# link $HOME dotfiles
echo "Making \$HOME symlinks"
ln -sfv $DOTFILES_DIR/home/.aliasrc $HOME/
#ln -sfv $DOTFILES_DIR/home/.bashrc $HOME/
ln -sfv $DOTFILES_DIR/home/.profile $HOME/
ln -sfv $DOTFILES_DIR/home/.vimrc $HOME/
#ln -sfv $DOTFILES_DIR/home/.Xresources $HOME/
ln -sfv $DOTFILES_DIR/home/.zshrc $HOME/
echo "Done."


# link ~/.config dotfiles
echo "Making \$HOME/.config symlinks"
if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
    echo "Created config dir."
fi

ln -sfv $DOTFILES_DIR/config/nvim ~/.config/
#ln -sfv $DOTFILES_DIR/config/alacritty ~/.config/
#rm -rf ~/.config/kitty
#ln -sfv $DOTFILES_DIR/config/kitty ~/.config/
#ln -sfv $DOTFILES_DIR/config/awesome ~/.config/
#ln -sfv $DOTFILES_DIR/config/codeblocks ~/.config/
rm -rf ~/.config/htop
ln -sfv $DOTFILES_DIR/config/htop ~/.config/
#ln -sfv $DOTFILES_DIR/config/picom.conf ~/.config/
ln -sfv $DOTFILES_DIR/config/starship.toml ~/.config/
#ln -sfv $DOTFILES_DIR/config/volumeicon ~/.config/
echo "Done."


# link ~/.local/bin
echo "Making \$HOME/.local/bin symlinks"
if [ ! -d "$HOME/.local/bin" ]; then
    mkdir $HOME/.local/bin -p
    echo "Created home bin dir."
fi

#ln -sfv $DOTFILES_DIR/scripts/xrandr/detect_monitors.sh ~/.local/bin/detect_monitors
#ln -sfv $DOTFILES_DIR/scripts/launchers/launch_volumeicon.sh ~/.local/bin/launch_volumeicon
#ln -sfv $DOTFILES_DIR/scripts/launchers/launch_wicd.sh ~/.local/bin/launch_wicd
#ln -sfv $DOTFILES_DIR/scripts/launchers/launch_compton.sh ~/.local/bin/launch_compton
#ln -sfv $DOTFILES_DIR/scripts/dmenu/power_options.sh ~/.local/bin/power_options
#ln -sfv $DOTFILES_DIR/scripts/dmenu/quicklaunch.sh ~/.local/bin/quicklaunch
#ln -sfv $DOTFILES_DIR/scripts/dmenu/open_files.sh ~/.local/bin/open_files
echo "Done."


# link ~/.screenlayout
#echo "Making \$HOME/.screenlayout symlinks"
#if [ ! -d "$HOME/.screenlayout" ]; then
#    mkdir $HOME/.screenlayout
#    echo "Created screenlayout dir."
#fi

#ln -sfv $DOTFILES_DIR/scripts/xrandr/default.sh ~/.screenlayout/
#ln -sfv $DOTFILES_DIR/scripts/xrandr/extend_right.sh ~/.screenlayout/
#ln -sfv $DOTFILES_DIR/scripts/xrandr/extend_right_and_top.sh ~/.screenlayout/
#echo "Done."


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
#if [ ! -d "$HOME/Pictures/screenshots" ]; then
#    mkdir $HOME/Pictures/screenshots -p
#    echo "Created screenshots dir"
#fi

exit 0
