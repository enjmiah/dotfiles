###########
# Aliases #
###########

alias rm='rm -i'
alias ls='ls -A --color=auto'
function rip() {
    rg -ip "$@" | less -FRX
}
alias less='less -FRX'
alias python2='/c/Anaconda3/envs/py27/python.exe'
alias bashrc='start ~/.bashrc'
alias subl="subl -n"
alias v='\vim'
function vi() {
    nvim-qt --qwindowgeometry 800x600 $@ &
}
alias view='vi -- -R'

#########################
# Environment variables #
#########################

export EDITOR='nvim-qt --qwindowgeometry 800x600'
export PAGER=less
export PYTHONDONTWRITEBYTECODE=1

####################
# Start-up scripts #
####################

eval "$(dircolors -b /etc/DIR_COLORS)"

##########
# Prompt #
##########

PS1=''
PS1="$PS1"'\n'                    # new line
PS1="$PS1"'\[\033[30;41m\] '      # change to red
PS1="$PS1"'\u@\h '                # user@host<space>
PS1="$PS1"'\[\033[31;47m\] '     # change to yellow
PS1="$PS1"'\[\033[30m\]'          # font colour to black
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

export PS2=" "
