alias dev="cd /src"
alias push="git push origin head"
alias s="git status"

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -gx EDITOR vim
set -gx TERM xterm-256color-italic
set -gx WORKON_PATH ~/.workon

# for rbenv
status --is-interactive; and source (rbenv init -|psub)
