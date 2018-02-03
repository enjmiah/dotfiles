#
# .zshrc
#
# Based on the default oh-my-zsh zshrc.
#
# Author:
#     Jerry Yin / jerryyin.info
#
# License:
#     Any copyright is dedicated to the Public Domain.
#     http://creativecommons.org/publicdomain/zero/1.0/
#

#############
# oh-my-zsh #
#############

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=30

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plug-in can be found in ~/.oh-my-zsh/plugins/*)
# Custom plug-ins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh

# I don't like oh-my-zsh aliases :/
unalias -m '*'

#########################
# Environment variables #
#########################

export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="/usr/local/MATLAB/R2017a/bin:$PATH"
export PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"
export PATH="/usr/local/bin:$PATH"

[[ "$(cat "/proc/${PPID}/comm")" == "xfce4-terminal" ]] && export XFCE_TERMINAL=1

export LANG=en_US.UTF-8

export EDITOR='vim'
type nvim &> /dev/null && export EDITOR='nvim'

###########
# Aliases #
###########

# prompt before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias bye='exit'
[ -e /media/jerry/Data ] && alias data='cd /media/jerry/Data'
type rg &> /dev/null     && function rip() { rg -ip "$@" | less -FRX; } # ripgrep
alias l='ls'
alias ll='ls -hl --color=auto'
alias ls='ls -A --color=auto'
alias logmeout='qdbus org.kde.ksmserver /KSMServer logout 0 0 0'
alias neofetch='neofetch --gap -1 --backend w3m --gtk2 off --gtk3 off --disable model'
function spawn() { $@ &> /dev/null & disown }
if type nvim &> /dev/null; then
    alias vi='nvim'
    alias vim='nvim'
    alias vmux='nvim -u ~/.vim/termrc'
fi # I prefer console vim on Linux, since colours are better there

####################
# Start-up scripts #
####################

# Configure ls colors
eval "$(dircolors ~/.dircolors)";

# Blur the background of Konsole windows
# Source: https://yuenhoe.com/blog/2013/10/applying-kwin-blur-to-transparent-konsoleyakuake-windows/
konsolex=$(qdbus | grep konsole | cut -f 2 -d\ )
if [ -n "$konsolex" ]; then
    for konsole in `xdotool search --class konsole`; do
        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $konsole;
    done
fi

# Syntax highlighting
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

##########
# Prompt #
##########

source "$HOME/dotfiles/prompt-utils.sh"
if [[ -f "$HOME/dotfiles/git-prompt.sh" ]]; then
    . "$HOME/dotfiles/git-prompt.sh"
fi

PROMPT=''
PROMPT="$PROMPT"$'\n''%{$bg[blue]$fg[white]%} %* '
PROMPT="$PROMPT"'$(__job_info)%~ '
PROMPT="$PROMPT"'$reset_color%{$fg[white]%} %{$fg[green]%}$(__custom_git_ps1)%{$reset_color%}'
PROMPT="$PROMPT"$'\n''%{$(__exit_status_ps1)%G%} '

ZSH_THEME_GIT_PROMPT_PREFIX=' '
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY='*'
ZSH_THEME_GIT_PROMPT_CLEAN=''
