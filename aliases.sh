# prompt before overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

if [[ "$TERM" == "cygwin" ]]; then
    alias data='cd /d'
    alias python2='/c/Anaconda3/envs/py27/python.exe'
else
    alias logmeout='qdbus org.kde.ksmserver /KSMServer logout 0 0 0'
fi

alias ag='ag --pager="less -FRX"'
alias brightness='qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness'
function cd() { pushd "$@" > /dev/null; } # allows going back with `popd`
[ -e /media/jerry/Data ] && alias data='cd /media/jerry/Data'
alias h='hugo server -D'
alias l='ls'
alias less='less -FRX'
alias ll='ls -Ahl --color=auto'
alias ls='ls -A --color=auto -I NTUSER.DAT\* -I ntuser.dat\*'
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

function today() {
    cat <<EOF
                  .-'
              '--./ /     _.---.
              '-,  (__..-'       \
                 \          .     |
                  ',.__.   ,__.--/
                    '._/_.'___.-'

EOF
    khal calendar today 14d
}
