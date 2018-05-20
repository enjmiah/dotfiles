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

source ~/dotfiles/aliases.sh

#########################
# Environment variables #
#########################

export PAGER=less
[[ "$TERM" == "cygwin" ]] && export PATH="$PATH:/c/bin"

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
PS1="$PS1"'`__job_info \j`'                    # jobs count + separator
PS1="$PS1"'\u@\h  '                           # user@host
PS1="$PS1"'\w '                                # pwd
PS1="$PS1"'\[\033[37;49m\] '                  # change to default
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
