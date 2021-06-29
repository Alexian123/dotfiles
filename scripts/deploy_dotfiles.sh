# !/bin/sh

# Symlink dotfiles and create required dirs in $HOME

DOTFILES_DIR="$HOME/Documents/dotfiles"

# simulate loading for nicer output
load_with_msg () {
    echo -n "$1"
    for i in 1 2 3
    do
        echo -n "."
        sleep 0.1
    done
    echo ""
}

# link $HOME dotfiles
load_with_msg "Making \$HOME symlinks"
ln -sfv $DOTFILES_DIR/home/.aliasrc $HOME/
#ln -sfv $DOTFILES_DIR/home/.bashrc $HOME/
ln -sfv $DOTFILES_DIR/home/.profile $HOME/
#ln -sfv $DOTFILES_DIR/home/.vimrc $HOME/
ln -sfv $DOTFILES_DIR/home/.Xresources $HOME/
ln -sfv $DOTFILES_DIR/home/.zshrc $HOME/
echo "Done."


# link ~/.config dotfiles
load_with_msg "Making \$HOME/.config symlinks"
if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
    echo "Created config dir."
fi

ln -sfv $DOTFILES_DIR/config/nvim ~/.config/
ln -sfv $DOTFILES_DIR/config/alacritty ~/.config/
#rm -rf ~/.config/kitty
#ln -sfv $DOTFILES_DIR/config/kitty ~/.config/
ln -sfv $DOTFILES_DIR/config/awesome ~/.config/
ln -sfv $DOTFILES_DIR/config/codeblocks ~/.config/
rm -rf ~/.config/htop
ln -sfv $DOTFILES_DIR/config/htop ~/.config/
ln -sfv $DOTFILES_DIR/config/picom.conf ~/.config/
ln -sfv $DOTFILES_DIR/config/starship.toml ~/.config/
ln -sfv $DOTFILES_DIR/config/volumeicon ~/.config/
echo "Done."


# link ~/.local/bin
load_with_msg "Making \$HOME/.local/bin symlinks"
if [ ! -d "$HOME/.local/bin" ]; then
    mkdir $HOME/.local/bin -p
    echo "Created home bin dir."
fi

ln -sfv $DOTFILES_DIR/scripts/detect_monitors.sh ~/.local/bin/detect_monitors
ln -sfv $DOTFILES_DIR/scripts/launch_volumeicon.sh ~/.local/bin/launch_volumeicon
#ln -sfv $DOTFILES_DIR/scripts/launch_wicd.sh ~/.local/bin/launch_wicd
ln -sfv $DOTFILES_DIR/scripts/launch_compton.sh ~/.local/bin/launch_compton
ln -sfv $DOTFILES_DIR/scripts/power_options.sh ~/.local/bin/power_options
ln -sfv $DOTFILES_DIR/scripts/quicklaunch.sh ~/.local/bin/quicklaunch
ln -sfv $DOTFILES_DIR/scripts/open_files.sh ~/.local/bin/open_files
echo "Done."


# link ~/.screenlayout
load_with_msg "Making \$HOME/.screenlayout symlinks"
if [ ! -d "$HOME/.screenlayout" ]; then
    mkdir $HOME/.screenlayout
    echo "Created screenlayout dir."
fi

ln -sfv $DOTFILES_DIR/scripts/xrandr/default.sh ~/.screenlayout/
ln -sfv $DOTFILES_DIR/scripts/xrandr/extend_right.sh ~/.screenlayout/
ln -sfv $DOTFILES_DIR/scripts/xrandr/extend_right_and_top.sh ~/.screenlayout/
echo "Done."


# create undodir for nvim/vim
#if [ ! -d "$HOME/.vim/undodir" ]; then
#    mkdir $HOME/.vim/undodir -p
#    echo "Created vim undodir"
#fi

if [ ! -d "$HOME/.cache/nvim/undodir" ]; then
    mkdir $HOME/.cache/nvim/undodir -p
    echo "Created nvim undodir."
fi


# create screenshots dir 
if [ ! -d "$HOME/Pictures/screenshots" ]; then
    mkdir $HOME/Pictures/screenshots -p
    echo "Created screenshots dir"
fi

exit 0
