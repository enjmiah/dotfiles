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

function __job_info() {
    local lf='
'
    local lastjob="`jobs`"
    lastjob="${lastjob//\\/\\\\}" # preserve backslash in output
    lastjob="${lastjob%%"lf"*}"
    lastjob="${lastjob##* }"
    if [[ ! -z "${lastjob}" ]]; then
        printf "(${lastjob}) "
    fi
    return $?
}

PS1=''
PS1="$PS1"'\n'                    # new line
PS1="$PS1"'\[\033[30;41m\] '      # change to red
PS1="$PS1"'\t '                   # time
PS1="$PS1"'\[\033[31;46m\] '     # change to yellow
PS1="$PS1"'\[\033[30m\]'          # font colour to black
PS1="$PS1"'\j `__job_info`'       # number of jobs
PS1="$PS1"'\[\033[36;47m\] '     # change to yellow
PS1="$PS1"'\[\033[30m\]'          # font colour to black
PS1="$PS1"'\u@\h  '              # user@host<space>
PS1="$PS1"'\w '                   # current working directory
PS1="$PS1"'\[\033[37;40m\]'      # change to default
if test -z "$WINELOADERNOEXEC"; then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"; then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'\[\033[36m\]'  # change color to cyan
        PS1="$PS1"'`__git_ps1`'   # bash function
    fi
fi
PS1="$PS1"'\[\033[0m\]'           # change color
PS1="$PS1"'\n'                    # new line
PS1="$PS1"'☰ '                    # prompt
export PROMPT_DIRTRIM=3

export PS2=" "
