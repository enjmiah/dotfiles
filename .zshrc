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

# Powerline plugin
# if [[ -r ~/anaconda3/lib/python3.6/site-packages/powerline_status-2.6-py3.6.egg/powerline/bindings/zsh/powerline.zsh ]]; then
#    source ~/anaconda3/lib/python3.6/site-packages/powerline_status-2.6-py3.6.egg/powerline/bindings/zsh/powerline.zsh
# fi

# ZSH_THEME="amuse"

# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=30

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plug-in can be found in ~/.oh-my-zsh/plugins/*)
# Custom plug-ins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# I don't like oh-my-zsh aliases :/
unalias -m '*'

#########################
# Environment variables #
#########################

export PATH=/usr/local/texlive/2016/bin/x86_64-linux:$HOME/anaconda3/bin:$HOME/bin:/usr/local/bin:$PATH

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='subl'
fi

export OCIO=/media/jerry/Data/config/ocio

###########
# Aliases #
###########

alias cp='cp -i' # prompt before overwriting
alias mv='mv -i' # prompt before overwriting
alias rm='rm -i' # prompt before overwriting

alias bye='exit'
alias data='cd /media/jerry/Data'
function rip() { rg -ip "$@" | less -FRX; } # ripgrep
alias l='ls'
alias ll='ls -l --color=auto'
alias ls='ls -A --color=auto'
alias logmeout='qdbus org.kde.ksmserver /KSMServer logout 0 0 0'
function noh() { nohup $1 >/dev/null 2>&1 &; }
alias v='\vim'
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

PROMPT='
%{$bg[blue]$fg[white]%} %* %{$bg[white]$fg[blue]%} %{$fg[black]%}%~ $reset_color%{$fg[white]%} %{$fg[green]%}$(__custom_git_ps1)%{$reset_color%}
%{$(__exit_status_ps1)%G%} '

ZSH_THEME_GIT_PROMPT_PREFIX=' '
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY='*'
ZSH_THEME_GIT_PROMPT_CLEAN=''
