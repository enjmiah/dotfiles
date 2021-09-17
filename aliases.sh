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
[ -e /media/$USER/Data ] && alias data='cd /media/$USER/Data'
[ -e /c/Users/$USER/d ] && alias data='cd /c/Users/$USER/d'
alias cmake-vcpkg="cmake -DCMAKE_TOOLCHAIN_FILE=$(dirname $(which vcpkg))/scripts/buildsystems/vcpkg.cmake"
alias erl="erl -eval 'code:add_path(\"$HOME/.local/share/erl\")'"
alias flux="xflux -l 49.263569 -g -123.138573 -k 3600"
alias h='hugo server -D'
alias l='ls'
alias less='less -FR'
alias ll='ls -Ahl --color=auto'
type rg &> /dev/null && function rip() { rg -Sp "$@" | less -FRX; }
function spawn() { $@ &> /dev/null & disown; }
alias v='vim'
alias view='vim -R'
[ -e ~/d/Code/3rdparty/vcpkg ] && alias vcpkg="$HOME/d/Code/3rdparty/vcpkg/vcpkg"

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

if type pass &> /dev/null; then
    export PASSWORD_STORE_DIR=~/journal
    alias pass=' PASSWORD_STORE_DIR=~/.password-store pass'
    alias jo='\pass'
    alias j='\pass edit'
    function jot {
        \pass edit $(date +'%Y/%m/%d').md
    }
fi
alias gp='git push'
alias n='ninja'
alias t='ninja && ./run_tests.sh'
alias pdf='spawn sumatrapdf'
