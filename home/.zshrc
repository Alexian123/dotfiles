setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh_history

# Archive extraction
# usage: extr <file>
extr ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1   ;;
            *.tar.gz)   tar xzf $1   ;;
            *.bz2)      bunzip2 $1   ;;
            *.rar)      unrar x $1   ;;
            *.gz)       gunzip $1    ;;
            *.tar)      tar xf $1    ;;
            *.tbz2)     tar xjf $1   ;;
            *.tgz)      tar xzf $1   ;;
            *.zip)      unzip $1     ;;
            *.Z)        uncompress $1;;
            *.7z)       7z x $1      ;;
            *.deb)      ar x $1      ;;
            *.tar.xz)   tar xf $1    ;;
            *.tar.zst)  unzstd $1    ;;
            *)          echo "'$1' cannot be extracted using extr()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Aliases
#
# nvim as vim
alias vim="nvim"
#
#
# package management
#
# apt/apltitude
alias apts="aptitude search" # search for package
alias apti="sudo aptitude install" # install package
alias aptr="sudo aptitude remove" # remove package
alias aptp="sudo aptitude purge" # remove package and configs
alias aptu="sudo aptitude update && sudo aptitude upgrade" # update packages
alias aptsi="apt list --installed | grep" # search installed packages
#
# pacman/yay
#alias pacss="pacman -Ss" # search for standard package
#alias yayssa="yay -Ssa" # search for aur package
#alias yayss="yay -Ss" # search for any package
#alias pacs="sudo pacman -S" # install standard package
#alias yays="yay -S" # install any package
#alias pacrns="sudo pacman -Rns" # remove package
#alias yayrns="yay -Rns" # remove any package
#alias pacsyu="sudo pacman -Syu" # update standard packages
#alias yaysyua="yay -Syua" # update aur packages
#alias yaysyu="yay -Syu" # update all packages
#alias pacqs="pacman -Qs" # search installed packages
#alias pacqdt="pacman -Qdt" # list unneeded packages
#
# snap
#alias snfi="snap find"
#alias snfo="snap info"
#alias snin="sudo snap install"
#alias snli="snap list"
#alias snrm="sudo snap remove"
#alias snre="sudo snap refresh"
#
# flatpak
alias flatin="sudo flatpak install"
alias flatun="sudo flatpak uninstall"
alias flatup="sudo flatpak update"
alias flats="flatpak search"
alias flatl="flatpak list"
alias flatinf="flatpak info"
#
# navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias _="cd -"
#
# colorized ls output
alias ls="ls --color=always --group-directories-first"
alias la="ls -a --color=always --group-directories-first"
alias ll="ls -l --color=always --group-directories-first"
alias lal="ls -al --color=always --group-directories-first"
alias l.="ls -a --color=always --group-directories-first | egrep '^\.'"
#
# replace ls with exa
#alias ls="exa --color=always --group-directories-first" # basic listing
#alias la="exa -a --color=always --group-directories-first" # list all
#alias ll="exa -l --color=always --group-directories-first" # long listing
#alias lal="exa -la --color=always --group-directories-first" # long list all
#alias l.='exa -a | egrep "^\."' # list only hidden files
#
# colorize grep output
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
#
# flags
alias cp="cp -i"    # confirm before overwriting
alias df="df -h"    # human readable output
alias du="du -h"    # human readable output
#
# dotfiles bare repo
#alias dotgit='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# prompt
eval "$(starship init zsh)"

# sys info
pfetch
