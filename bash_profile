PS1='$ \e];\a\e[33m\w\e[32m$(__git_ps1)\e[m '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export CLICOLOR=1

alias dev="cd ~/"
alias s="git status"
alias a="git commit --amend"

if [ -f ~/.sensible.bash ]; then
  . ~/.sensible.bash
fi

sh $HOME/.base16-ocean.dark.sh

# Docker

# alias dci="docker rmi $(docker images -qf dangling=true)"
# alias dcc="docker rm $(docker ps -a -q)"

# Go

export GOPATH=~/go
export PATH="$HOME/go/bin:$PATH"
