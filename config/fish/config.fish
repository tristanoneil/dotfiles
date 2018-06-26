alias am="git commit --amend"
alias b="git branch"
alias c="git checkout"
alias dev="cd ~/src"
alias pull="git pull origin HEAD"
alias push="git push origin head"
alias s="git status"

set -gx EDITOR vim

# fallback to npx
source (npx --shell-auto-fallback fish | psub)
