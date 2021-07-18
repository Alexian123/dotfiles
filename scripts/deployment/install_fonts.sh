#! /bin/sh

FONTS_DIR="$HOME/Documents/dotfiles/fonts"
LOCAL_FONTS_DIR="$HOME/.local/share/fonts"

if [ ! -d $LOCAL_FONTS_DIR ]; then
    mkdir $LOCAL_FONTS_DIR
    echo "Created local fonts dir."
fi

# DroidSansMono
ln -sfv "$FONTS_DIR/DroidSansMono/Droid Sans Mono Nerd Font Complete Mono.otf" $LOCAL_FONTS_DIR

echo "Done."

exit 0
