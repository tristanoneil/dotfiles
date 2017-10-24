alias s="git status"
alias dev="cd /src/orca/repos"
alias m="orca maji run"
alias sn="docker exec -it snss"
alias m-spring="docker exec -d maji spring server"

bass source ~/.rvm/scripts/rvm

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -gx EDITOR vim
set -gx PATH $PATH ~/go/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx ORCA_DIR /src/orca

set -gx TERM xterm-256color-italic
set -gx WORKON_PATH ~/.workon
