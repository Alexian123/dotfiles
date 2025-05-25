#!/bin/sh

DOTFILES="$(dirname "$(realpath "$0")")"
DOTFILES_DIR="$DOTFILES/configs"
DEPLOY_CONFIG_FILE="$DOTFILES/deploy.cfg"

FALSE="false"
TRUE="true"

# Function to read variables from the config file
read_config() {
    local var_name="$1"
    local default_value="$2"
    local value

    # Find the variable in the config file
    value=$(grep "^${var_name}=" "$DEPLOY_CONFIG_FILE" | cut -d '=' -f 2 | tr -d '[:space:]')

    # If not found use default value
    if [ -z "$value" ]; then
        echo "Invalid value for ${var_name} in ${DEPLOY_CONFIG_FILE}. Using default: ${default_value}" >&2  #stderr
        value="$default_value"
    fi

    echo "$value"
}

# Read variables
ALACRITTY=$(read_config "ALACRITTY" "$FALSE")
ALIASRC=$(read_config "ALIASRC" "$FALSE")
AWESOME=$(read_config "AWESOME" "$FALSE")
BASHRC=$(read_config "BASHRC" "$FALSE")
HTOP=$(read_config "HTOP" "$FALSE")
KITTY=$(read_config "KITTY" "$FALSE")
NEOVIM=$(read_config "NEOVIM" "$FALSE")
PFETCH=$(read_config "PFETCH" "$FALSE")
PICOM=$(read_config "PICOM" "$FALSE")
PROFILE=$(read_config "PROFILE" "$FALSE")
STARSHIP=$(read_config "STARSHIP" "$FALSE")
VIMRC=$(read_config "VIMRC" "$FALSE")
VOLUMEICON=$(read_config "VOLUMEICON" "$FALSE")
XRESOURCES=$(read_config "XRESOURCES" "$FALSE")
ZSHRC=$(read_config "ZSHRC" "$FALSE")
DMENU=$(read_config "DMENU" "$FALSE")
WICD=$(read_config "WICD" "$FALSE")
REDSHIFT=$(read_config "REDSHIFT" "$FALSE")

# Create .local/bin dir
if [ ! -d "$HOME/.local/bin" ]; then
    mkdir -p $HOME/.local/bin
    echo "Created .local/bin dir"
fi

# Create .local/src dir
if [ ! -d "$HOME/.local/src" ]; then
    mkdir $HOME/.local/src
    echo "Created .local/src dir"
fi

# Install starship prompt
if [ "$STARSHIP" = "$TRUE" ]; then
    echo "Installing starship"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    echo "Done."
fi

# Install pfetch
if [ "$PFETCH" = "$TRUE" ]; then
    echo "Installing pfetch"
    git clone "https://github.com/dylanaraps/pfetch" $HOME/.local/src/pfetch
    cd $HOME/.local/src/pfetch && sudo make install
    cd -
    echo "Done."
fi

# Link $HOME dotfiles
echo "Linking \$HOME dotfiles"

if [ "$ALIASRC" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.aliasrc $HOME/
fi

if [ "$BASHRC" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.bashrc $HOME/
fi

if [ "$PROFILE" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.profile $HOME/
fi

if [ "$VIMRC" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.vimrc $HOME/
fi

if [ "$XRESOURCES" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.Xresources $HOME/
fi

if [ "$ZSHRC" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.zshrc $HOME/
fi

echo "Done."


# Link $HOME/.config dotfiles
echo "Linking \$HOME/.config dotfiles"

if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
    echo "Created .config dir"
fi

if [ "$NEOVIM" = "$TRUE" ]; then
    rm -rf $HOME/.config/nvim
    ln -sfv $DOTFILES_DIR/user/.config/nvim $HOME/.config/
fi

if [ "$ALACRITTY" = "$TRUE" ]; then
    rm -rf $HOME/.config/alacritty
    ln -sfv $DOTFILES_DIR/user/.config/alacritty $HOME/.config/
fi

if [ "$KITTY" = "$TRUE" ]; then
    rm -rf $HOME/.config/kitty
    ln -sfv $DOTFILES_DIR/user/.config/kitty $HOME/.config/
fi

if [ "$AWESOME" = "$TRUE" ]; then
    rm -rf $HOME/.config/awesome
    ln -sfv $DOTFILES_DIR/user/.config/awesome $HOME/.config/
fi

if [ "$HTOP" = "$TRUE" ]; then
    rm -rf $HOME/.config/htop
    ln -sfv $DOTFILES_DIR/user/.config/htop $HOME/.config/
fi

if [ "$PICOM" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.config/picom.conf $HOME/.config/
    # Link picom launch script
    ln -sfv $DOTFILES/launchers/launch_compton.sh $HOME/.local/bin/launch_compton
fi

if [ "$STARSHIP" = "$TRUE" ]; then
    ln -sfv $DOTFILES_DIR/user/.config/starship.toml $HOME/.config/
fi

if [ "$VOLUMEICON" = "$TRUE" ]; then
    rm -rf $HOME/.config/volumeicon
    ln -sfv $DOTFILES_DIR/user/.config/volumeicon $HOME/.config/
    # Link volumeicon launch script
    ln -sfv $DOTFILES/launchers/launch_volumeicon.sh $HOME/.local/bin/launch_volumeicon
fi

echo "Done."

# Create undodir for vim
if [ "$VIMRC" = "$TRUE" ]; then
    if [ ! -d "$HOME/.vim/undodir" ]; then
        mkdir $HOME/.vim/undodir -p
        echo "Created vim undodir"
    fi
fi

# Create undodir for nvim
if [ "$NEOVIM" = "$TRUE" ]; then
    if [ ! -d "$HOME/.cache/nvim/undodir" ]; then
        mkdir $HOME/.cache/nvim/undodir -p
        echo "Created nvim undodir"
    fi
fi

# Link wicd launch script
if [ "$WICD" = "$TRUE" ]; then
    ln -sfv $DOTFILES/launchers/launch_wicd.sh $HOME/.local/bin/launch_wicd
fi

# Link redshift launch script
if [ "$REDSHIFT" = "$TRUE" ]; then
    ln -sfv $DOTFILES/launchers/launch_redshift.sh $HOME/.local/bin/launch_redshift
fi

# Link dmenu scripts
if [ "$DMENU" = "$TRUE" ]; then
    ln -sfv $DOTFILES/dmenu_scripts/open_files.sh $HOME/.local/bin/open_files
    ln -sfv $DOTFILES/dmenu_scripts/power_options.sh $HOME/.local/bin/power_options
    ln -sfv $DOTFILES/dmenu_scripts/quicklaunch.sh $HOME/.local/bin/quicklaunch
fi

exit 0
