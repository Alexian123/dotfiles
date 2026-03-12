# Default program paths
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/lxterminal
export GEDITOR=/usr/bin/mousepad
export WEB_BROWSER=/usr/bin/brave
export GUI_FILE_MANAGER=/usr/bin/pcmanfm
export SYS_MONITOR=/usr/bin/htop
#export DMENU=/usr/bin/dmenu
export DMENU="/usr/bin/rofi -theme Arc-Dark -dmenu"   # user rofi in dmenu mode
#export DMENU_RUN=/usr/bin/dmenu_run
export DMENU_RUN="/usr/bin/rofi -theme Arc-Dark -show combi -modes combi -combi-modes 'window,drun,run'"
export XSS_LOCK_SCREEN=/usr/bin/i3lock-fancy

# Configs
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export DOTFILES="$HOME/.local/src/dotfiles"
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
