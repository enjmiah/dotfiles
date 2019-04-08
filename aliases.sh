# prompt before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

if [[ "$TERM" == "cygwin" ]]; then
    # Git Bash for Windows
    alias data='cd /d'
    alias ls='ls -A --color=auto -I NTUSER.DAT\* -I ntuser.dat\*'
    alias python2='/c/Anaconda3/envs/py27/python.exe'
else
    # Linux, probably
    alias brightness='qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness'
    alias ls='ls -A --color=auto'
    alias logmeout='qdbus org.kde.ksmserver /KSMServer logout 0 0 0'
fi

if [[ ! -z "$BASH_VERSION" ]]; then
    function cd() { pushd "$@" > /dev/null; } # allows going back with `popd`
fi

alias ag='ag --pager="less -FRX"'
[ -e /media/jerry/Data ] && alias data='cd /media/jerry/Data'
alias erl="erl -eval 'code:add_path(\"$HOME/.local/share/erl\")'"
alias flux="xflux -l 49.263569 -g -123.138573 -k 3600"
alias h='hugo server -D'
alias l='ls'
alias less='less -FRX'
alias ll='ls -Ahl --color=auto'
type rg &> /dev/null && function rip() { rg -ip "$@" | less -FRX; }
function spawn() { $@ &> /dev/null & disown; }
alias v='vim'
alias view='vim -R'

if type nvim &> /dev/null; then
    alias vi='nvim'
    alias vim='nvim'
    alias vmux='nvim -u ~/.vim/termrc'
fi

function touchcmake() {
    local dir="."
    while [[ "$dir" != / ]]; do
        if [[ -e "$dir/CMakeLists.txt" ]]; then
            touch "$dir/CMakeLists.txt"
            return 0
        else
            dir="$(readlink -f "$dir"/..)"
        fi
    done
    echo "fatal: no CMakeLists.txt found" 1>&2
    return 1
}

function whale() {
    fc="$(tput setaf 4)"
    sc="$(tput setaf 7)"
    cat <<EOF
${fc}             .-'		
${fc}         '--./ /     _.---.	
${fc}         '-,  (__..-'       \	
${fc}            \          ${sc}.${fc}     |
${fc}             ',.__.   ,__.--/	
${sc}               '._${sc}/_.'${sc}___.-'
EOF
}

function whalefetch() {
    printf "\n\n\n"
    whale
    printf "\n\n\n"
    neofetch
    colordots
}

function today() {
    whale
    khal calendar today 14d
}
