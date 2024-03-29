# Prompt before overwriting.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias fd='fd -I'
alias flux="xflux -l 49.263569 -g -123.138573 -k 3600"
alias gp='git push'
alias gdiff='git diff --no-index'
alias h='hugo server -D'
alias l='ls'
alias ll='ls -Ahl --color=auto'
alias less='less -FR'
function spawn() { $@ &> /dev/null & disown; }
alias v='vim'
alias view='vim -R'

if type mold &> /dev/null; then
	alias n='mold -run ninja'
else
	alias n='ninja'
fi
alias t='ninja && ./run_tests.sh'

if [[ ! -z "$BASH_VERSION" ]]; then
	function cd() { pushd "$@" > /dev/null; } # allows going back with `popd`
fi

if [[ "$(uname)" =~ "MINGW" ]]; then
	alias ls='ls -A --color=auto --group-directories-first -I NTUSER.DAT\* -I ntuser.dat\*'
	alias pdf='spawn sumatrapdf'
	alias python2='~/Anaconda3/envs/py27/python.exe'
elif [[ "$(uname)" =~ "Darwin" ]]; then
	alias ls='ls -A --color=auto'
	alias start='open'
else # Linux, probably.
	alias ls='ls -A --color=auto --group-directories-first'
	alias start='xdg-open 2>/dev/null'
fi

type rg &> /dev/null && function rip() { rg -Sp "$@" | less -FRX; }

if type vcpkg &> /dev/null; then
	alias cmake-vcpkg="cmake -DCMAKE_TOOLCHAIN_FILE=$(dirname $(which vcpkg))/scripts/buildsystems/vcpkg.cmake"
fi
if [ -e ~/d/Code/3rdparty/vcpkg ]; then
	alias vcpkg="$HOME/d/Code/3rdparty/vcpkg/vcpkg"
fi

if type nvim &> /dev/null; then
	alias vi='nvim'
	alias vim='nvim'
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

if type pass &> /dev/null; then
	export PASSWORD_STORE_DIR=~/journal
	alias pass=' PASSWORD_STORE_DIR=~/.password-store pass'
	alias jo='\pass'
	alias j='\pass edit'
	function jot {
		\pass edit $(date +'%Y/%m/%d').md
	}
fi

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
