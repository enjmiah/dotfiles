#
# .bashrc
#
# Versatile bashrc designed to work in both Unix bash and Git Bash for Windows.
#
# Author:
#     Jerry Yin / jerryyin.info
#
# License:
#     Any copyright is dedicated to the Public Domain.
#     http://creativecommons.org/publicdomain/zero/1.0/
#

###########
# Aliases #
###########

alias cp='cp -i' # prompt before overwriting
alias mv='mv -i' # prompt before overwriting
alias rm='rm -i' # prompt before overwriting

alias bye='exit'
function cd() { pushd $@ > /dev/null; } # allows going back with `popd`
alias data='cd /d'
alias l='ls'
alias less='less -FRX'
alias ls='ls -A --color=auto -I NTUSER.DAT\* -I ntuser.dat\*'
alias python2='/c/Anaconda3/envs/py27/python.exe'
function rip() { rg -ip "$@" | less -FRX; } # ripgrep
function noh() { nohup $1 >/dev/null 2>&1 &; }
alias v='\vim'
if type nvim > /dev/null && [[ "$TERM" == "cygwin" ]]; then
    function vi() { nvim-qt --qwindowgeometry 800x600 $@ & }
    alias view='vi -- -R'
fi # I prefer console vim on Linux, since colours are better there


#########################
# Environment variables #
#########################

export EDITOR='nvim-qt --qwindowgeometry 800x600'
export PAGER=less
export PATH="$PATH:/c/bin"
export PYTHONDONTWRITEBYTECODE=1

####################
# Start-up scripts #
####################

# improve ls colours
if [[ -e "$HOME/.dircolors" ]]; then
    eval "$(dircolors ~/.dircolors)";
else
    eval "$(dircolors -b /etc/DIR_COLORS)"
fi

##########
# Prompt #
##########

source "$HOME/dotfiles/prompt-utils.sh"

PS1=''
PS1="$PS1"'\[\033[0m\]'                        # reset all
PS1="$PS1"'\n'
PS1="$PS1"'\[\033[30;44m\] '                   # change colour
PS1="$PS1"'\t '                                # time
PS1="$PS1"'`__last_command_runtime`'           # run time of last command
PS1="$PS1"'`__job_info \j`'                    # jobs count (most recent) + separator
PS1="$PS1"'\u@\h  '                           # user@host
PS1="$PS1"'\w '                                # pwd
PS1="$PS1"'\[\033[39;49m\] '                  # change to default
if [[ -z "$WINELOADERNOEXEC" ]]; then
    # git-prompt.sh wasn't pre-installed on all the machines I tested on
    if [[ -f "$HOME/dotfiles/git-prompt.sh" ]]; then
        . "$HOME/dotfiles/git-prompt.sh"
        PS1="$PS1"'\[\033[36m\]'               # change colour
        PS1="$PS1"'`__custom_git_ps1`'         # git info
    fi
fi
PS1="$PS1"'\[\033[0m\]'                        # reset all
PS1="$PS1"'\n'
PS1="$PS1"'$(__exit_status_ps1) '              # prompt

# magic that makes automatic timing of commands work
trap '__timer_start' DEBUG # run before executing any command
PROMPT_COMMAND=__timer_stop # run before printing the prompt

export PROMPT_DIRTRIM=3 # have \w show at most 3 directories

PS2=" "
