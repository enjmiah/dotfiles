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

export EDITOR='nvim-qt --qwindowgeometry 800x600'
export PAGER=less
export PYTHONDONTWRITEBYTECODE=1

eval "$(dircolors -b /etc/DIR_COLORS)"
