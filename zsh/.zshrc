ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="robbyrussell"
#ZSH_THEME="cloud"
#ZSH_THEME="fino"
ZSH_THEME="lambda-mod"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(vi-mode git npm tmux z colored-man-pages colorize cp zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:~/.gem/ruby/2.3.0/bin:$PATH
export TERM=xterm-256color
export LANG=zh_CN.UTF-8
source ~/.zsh_aliases
