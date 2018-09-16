#
# .zshrc
#
# Lightweight zshrc.
#
# Author:
#     Jerry Yin / jerryyin.info
#
# License:
#     Any copyright is dedicated to the Public Domain.
#     http://creativecommons.org/publicdomain/zero/1.0/
#

################
# Key-bindings #
################

# Copied from oh-my-zsh

bindkey -e

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [PageUp] - Up a line of history
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history
fi

# [PageDown] - Down a line of history
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history
fi

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

###########
# History #
###########

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

#########################
# Environment variables #
#########################

export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/Applications/MATLAB-R2018a/bin:$PATH"
export PATH="$HOME/Applications/texlive2018/bin/x86_64-linux:$PATH"
export PATH="$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/8.0.2/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

[[ "$(cat "/proc/${PPID}/comm")" == "xfce4-terminal" ]] && export XFCE_TERMINAL=1

export LANG=en_US.UTF-8
export LESSHISTFILE=-
export EDITOR='vim'
type nvim &> /dev/null && export EDITOR='nvim'

###########
# Aliases #
###########

source ~/dotfiles/aliases.sh

####################
# Start-up scripts #
####################

# Configure ls colors
eval "$(dircolors ~/.dircolors)";

# Syntax highlighting
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

##########
# Prompt #
##########

autoload -U colors && colors

setopt prompt_subst

if [[ -f ~/dotfiles/prompt-utils.sh && -f ~/dotfiles/git-prompt.sh ]]; then
    source ~/dotfiles/prompt-utils.sh
    source ~/dotfiles/git-prompt.sh

    PROMPT=''
    PROMPT="$PROMPT"$'\n''%{$bg[blue]$fg[white]%} %* '
    PROMPT="$PROMPT"'$(__job_info)%~ '
    PROMPT="$PROMPT"'$reset_color%{$fg[white]%} %{$fg[green]%}$(__custom_git_ps1)%{$reset_color%}'
    PROMPT="$PROMPT"$'\n''%{$(__exit_status_ps1)%G%} '
fi
