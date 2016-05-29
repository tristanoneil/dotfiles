export TERM=xterm-256color

alias s="git status"

bass source ~/.nvm/nvm.sh
bass source ~/.rvm/scripts/rvm

set -gx PATH /home/vagrant/go/bin $PATH
set -gx GOPATH /home/vagrant/go
