###########
# Aliases #
###########

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias bye='exit'
function cd() { pushd $@ > /dev/null; }
alias data='cd /d'
alias l='ls'
alias less='less -FRX'
alias ls='ls -A --color=auto -I NTUSER.DAT\* -I ntuser.dat\*'
alias python2='/c/Anaconda3/envs/py27/python.exe'
function rip() { rg -ip "$@" | less -FRX; }
alias subl="subl -n"
alias v='\vim'
function vi() { nvim-qt --qwindowgeometry 800x600 $@ & }
alias view='vi -- -R'

#########################
# Environment variables #
#########################

export EDITOR='nvim-qt --qwindowgeometry 800x600'
export PAGER=less
export PATH="$PATH:/c/bin"
export PYTHONDONTWRITEBYTECODE=1
export RUST_SRC_PATH="$HOME/.multirust/toolchains/stable-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src"

####################
# Start-up scripts #
####################

eval "$(dircolors -b /etc/DIR_COLORS)"

##########
# Prompt #
##########

function __timer_start() {
    timer=${timer:-$SECONDS}
}

function __timer_stop() {
    timer_show=$(($SECONDS - $timer))
    unset timer
}

function __last_command_runtime() {
    local RTNVAL="$?"
    if [[ ${timer_show} -gt 7 ]]; then
        printf " ${timer_show}s "
    fi
    return $RTNVAL
}

function __job_info() {
    local RTNVAL="$?"
    local lf='
'
    local lastjob="`jobs`"
    lastjob="${lastjob//\\/\\\\}" # preserve backslash in output
    lastjob="${lastjob%%"lf"*}"
    lastjob="${lastjob##* }"
    if [[ ! -z "${lastjob}" ]]; then
        printf "\033[34;43m "
        printf "\033[30m"
        printf "$1 (${lastjob}) "
        printf "\033[33;47m "
    else
        printf "\033[34;47m "
    fi
    printf '\033[30m'
    return $RTNVAL
}

function __custom_git_ps1() {
    local RTNVAL="$?"
    local out="$(__git_ps1)" commithash
    if [[ ! -z "${out}" ]]; then
        echo "${out}" | grep "\.\.\." &> /dev/null
        if [[ $? != 0 ]]; then
            out="${out:2:-1}"
            commithash="$(git rev-parse --short HEAD 2> /dev/null)"
            if [[ ! -z "${commithash}" ]]; then
                commithash="(${commithash})"
                out="${out} ${commithash}"
            fi
        else
            # detached HEAD state
            out="${out:3:-2}"
        fi
        out=" ${out}"
        printf "$out"
    fi
    return $RTNVAL
}

function __exit_status_ps1() {
    if [[ $? == 0 ]]; then
        printf "☰"
    else
        printf '\033[31m✘\033[0m'
    fi
    return $?
}

PS1=''
PS1="$PS1"'\n'
PS1="$PS1"'\[\033[30;44m\] '                   # change colour
PS1="$PS1"'\t '                                # time
PS1="$PS1"'`__last_command_runtime`'           # show runtime of last command
PS1="$PS1"'`__job_info \j`'                    # optional jobs count + recent
PS1="$PS1"'\u@\h  '                           # user@host
PS1="$PS1"'\w '                                # pwd
PS1="$PS1"'\[\033[37;40m\] '                  # change to default
if [[ -z "$WINELOADERNOEXEC" ]]; then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if [[ -f "$COMPLETION_PATH/git-prompt.sh" ]]; then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'\[\033[36m\]'               # change colour
        PS1="$PS1"'`__custom_git_ps1`'         # git info
    fi
fi
PS1="$PS1"'\[\033[0m\]'                        # change colour
PS1="$PS1"'\n'
PS1="$PS1"'$(__exit_status_ps1) '              # prompt

trap '__timer_start' DEBUG
PROMPT_COMMAND=__timer_stop
export PROMPT_DIRTRIM=3

PS2=" "
