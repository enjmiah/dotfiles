# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/texlive/2016/bin/x86_64-linux:$HOME/anaconda3/bin:$HOME/bin:/usr/local/bin:$PATH
source $HOME/.cargo/env

# Path to your oh-my-zsh installation.
export ZSH=/home/jerry/.oh-my-zsh

# Powerline plugin
# if [[ -r ~/anaconda3/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#   source ~/anaconda3/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
# fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='subl'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias zshconfig="subl ~/.zshrc"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias ls="ls -A --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias ll="ls -l"
alias data="cd /media/jerry/Data"
noh() {
  nohup $1 > /dev/null &
}

export OCIO=/media/jerry/Data/config/ocio

# Configure ls colors
eval "$(dircolors ~/.dircolors)";

# Blur the background of Konsole windows
# Source: https://yuenhoe.com/blog/2013/10/applying-kwin-blur-to-transparent-konsoleyakuake-windows/
konsolex=$(qdbus | grep konsole | cut -f 2 -d\ )
if [ -n "$konsolex" ]; then
    for konsole in `xdotool search --class konsole`; do
        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $konsole;
    done
fi
