export EDITOR=vim
export VISUAL=vim
export TERMINAL=/usr/bin/lxterminal
export GEDITOR=mousepad
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export DOTFILES="$HOME/Documents/dotfiles"
export QT_STYLE_OVERRIDE=kvantum
export PF_INFO="ascii title os host kernel uptime memory"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes cargo bins
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
