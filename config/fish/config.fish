alias am="git commit --amend"
alias b="git branch"
alias co="git checkout"
alias cop="rubocop (git diff HEAD --name-only --diff-filter=MA & git diff master..HEAD --name-only --diff-filter=MA | sort | uniq)"
alias dev="cd ~/src"
alias pull="git pull origin HEAD"
alias push="git push origin head"
alias s="git status"
alias vim="nvim"

set -gx EDITOR vim
set fish_greeting
set -gx RUBYOPT ''

eval (/opt/homebrew/bin/brew shellenv)

source /opt/homebrew/opt/asdf/libexec/asdf.fish

if type -q rbenv
  source (rbenv init - | psub)
end

set -gx FZF_DEFAULT_OPTS '--color=fg:#aaaaaa,bg:#ffffff,hl:#0366d6
 --color=fg+:#aaaaaa,bg+:#ffffff,hl+:#2188ff
 --color=info:#afaf87,prompt:#d7005f,pointer:#6f42c1
 --color=marker:#22863a,spinner:#6f42c1,header:#87afaf'
