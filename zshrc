ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git osx terminalapp)

source $ZSH/oh-my-zsh.sh

alias dev="cd /Users/Tristan/Documents/Development"
alias s="clear && git status"

source /usr/local/opt/chruby/share/chruby/chruby.sh

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export GOPATH=$HOME/go

chruby 2.0.0
