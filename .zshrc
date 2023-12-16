#
# .zshrc
#
# Lightweight zshrc.
#
# Author:
#     Jerry Yin / jerryyin.info
#
# License:
#     Any copyright is dedicated to the Public Domain.
#     http://creativecommons.org/publicdomain/zero/1.0/
#

################
# Key-bindings #
################

# Copied from oh-my-zsh

bindkey -e

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [PageUp] - Up a line of history
if [[ "${terminfo[kpp]}" != "" ]]; then
	bindkey "${terminfo[kpp]}" up-line-or-history
fi

# [PageDown] - Down a line of history
if [[ "${terminfo[knp]}" != "" ]]; then
	bindkey "${terminfo[knp]}" down-line-or-history
fi

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
	bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

if [[ -x "$(command -v uname)" && "$(uname)" =~ "MINGW" ]]; then
	bindkey "^[[3~" delete-char
fi

###########
# History #
###########

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

########
# Misc #
########

setopt autopushd pushdminus pushdsilent pushdtohome
setopt interactive_comments
autoload -U zmv
autoload -U compinit && compinit

#########################
# Environment variables #
#########################

export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [[ -e "/d/jerry/sketching" ]]; then
	export PYTHONPATH="/d/jerry/sketching/build-debug/python/core/:/d/jerry/sketching/python"
	export PATH="/d/jerry/sketching/tools:$PATH"
fi
export JUPYTER_PATH="${PYTHONPATH}"

export LANG=en_US.UTF-8
export LESSHISTFILE=-
export EDITOR='vim'
type nvim &> /dev/null && export EDITOR='nvim'

###########
# Aliases #
###########

source ~/dotfiles/aliases.sh
alias vi=vim

##########
# Prompt #
##########

AGKOZAK_BLANK_LINES=1
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' 'S')
AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_PROMPT_DIRTRIM=0

AGKOZAK_CUSTOM_PROMPT=''
# Username and hostname / virtual environment indicator
if [[ -x "$(command -v uname)" && "$(uname)" == "Linux" ]]; then
	AGKOZAK_CUSTOM_PROMPT+='%K{red}'
else
	AGKOZAK_CUSTOM_PROMPT+='%K{cyan}'
fi
AGKOZAK_CUSTOM_PROMPT+=' %(10V.[%10v].%(!.%S%B.%B)%n%1v%(!.%b%s.%f%b)) %k'
# Command execution time
AGKOZAK_CUSTOM_PROMPT+='%(9V.%K{yellow}%F{black} %9v %k%f.)'
# Path
AGKOZAK_CUSTOM_PROMPT+=$' %B%2v%b'
# Git status
AGKOZAK_CUSTOM_PROMPT+='%(3V.%F{green} (%6v)%f.)'$'\n'
# Prompt character / exit status
AGKOZAK_CUSTOM_PROMPT+='%(4V.:.%B%(?.%F{8}%#.%F{red}x)%f%b) '

source ~/dotfiles/.config/zsh/agkozak/agkozak-zsh-prompt.plugin.zsh

#######################
# Syntax highlighting #
#######################

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[alias]='bold'
ZSH_HIGHLIGHT_STYLES[arg0]='bold'
ZSH_HIGHLIGHT_STYLES[builtin]='bold'
ZSH_HIGHLIGHT_STYLES[command]='bold'
ZSH_HIGHLIGHT_STYLES[precommand]='bold'
ZSH_HIGHLIGHT_STYLES[function]='bold'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=green'

ZSH_HIGHLIGHT_STYLES[assign]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'

if [[ "$XFCE_TERMINAL" == 1 ]]; then
	ZSH_HIGHLIGHT_STYLES[comment]='fg=blue'
else
	ZSH_HIGHLIGHT_STYLES[comment]='fg=8'
fi
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=yel'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=yel'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=yel'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=yel'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=mag'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

####################
# Start-up scripts #
####################

# Configure ls colors
if type dircolors &> /dev/null; then
	if [[ -z "$SHELL" && "$(uname)" =~ "MINGW" ]]; then
		export SHELL="$(which zsh)"
	fi
	eval "$(dircolors ~/dotfiles/.dircolors)"
fi

PLUGINS=(syntax-highlighting autosuggestions)

for plug in $PLUGINS; do
	entry="$HOME/dotfiles/.config/zsh/$plug/zsh-$plug.zsh"
	if [[ -f "$entry" ]]; then
		source $entry
	fi
done

if type fzf &> /dev/null; then
	source "$HOME/dotfiles/.config/zsh/fzf/completion.zsh"
	source "$HOME/dotfiles/.config/zsh/fzf/key-bindings.zsh"
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=$ZSH_HIGHLIGHT_STYLES[comment]

# Switch to last directory on login.
if [ -f ~/.lastdir ] && [ "$(pwd)" = "$HOME" ]; then
	cd "`cat ~/.lastdir`"
fi
function record_last_dir {
	pwd > ~/.lastdir
}
precmd_functions+=record_last_dir

# Set the terminal title to the current directory name.
# Kitty does this automatically.
if test -z "$KITTY_INSTALLATION_DIR"; then
	function set_title_to_cwd {
		result=${PWD##*/}
		echo -ne "\e]0;${result:-/}\a"
	}
	precmd_functions+=set_title_to_cwd
fi
