#######################################
# Get PATH sorted out
#######################################

export PYENV_BIN="$HOME/.pyenv/bin"
export POETRY_BIN="$HOME/.poetry/bin"
export CUSTOM_BIN="$HOME/Documents/GitHub/toolz/bin"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export PATH="$PYENV_BIN:$POETRY_BIN:$CUSTOM_BIN:$PATH"

#######################################
# Setup ZSH
#######################################

export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages)
source $ZSH/oh-my-zsh.sh

#######################################
# Other Shell Things
#######################################

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups
# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000
# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=10000
# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

#######################################
# Setup Homebrew
#######################################

# export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1

#######################################
# Setup PYENV
#######################################

if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

#######################################
# Setup DIRENV
#######################################

if command -v direnv 1>/dev/null 2>&1; then
	eval "$(direnv hook bash)"
fi

#######################################
# Custom Aliases/Functions
#######################################

. ~/.aliases
. ~/.functions

printf "$(artii -f shadow "Welcome, $(hostname -f | sed -e 's/.local//')")\n$(neofetch)" | lolcat

