alias am="git commit --amend"
alias b="git branch"
alias co="git checkout"
alias cop="rubocop (git diff HEAD --name-only --diff-filter=MA & git diff master..HEAD --name-only --diff-filter=MA | sort | uniq)"
alias dev="cd ~/src"
alias pull="git pull origin HEAD"
alias push="git push origin head"
alias s="git status"
alias go="tmuxinator start maji"

set -gx EDITOR vim
# set -gx TERM xterm-256color-italic
set -gx WORKON_PATH /Users/tristanoneil/src/workon
set fish_greeting
set -gx RUBYOPT ''

if type -q rbenv
  source (rbenv init - | psub)
end
