alias am="git commit --amend"
alias b="git branch"
alias co="git checkout"
alias cop="bundle exec rubocop (git diff HEAD --name-only --diff-filter=MA & git diff master..HEAD --name-only --diff-filter=MA | sort | uniq)"
alias dev="cd ~/src"
alias pull="git pull origin HEAD"
alias push="git push origin head"
alias s="git status"
alias vim="nvim"
alias kill-chrome="pkill -f 'Chrome.*--disable-background-networking'"
alias c="clear"

set -gx EDITOR nvim -w
set -gx VISUAL nvim -w
set fish_greeting
set -gx RUBYOPT ''

eval (/opt/homebrew/bin/brew shellenv)

source /opt/homebrew/opt/asdf/libexec/asdf.fish

set -Ua fish_user_paths ./node_modules/.bin $fish_user_paths
set -Ua fish_user_paths (npm config get prefix)/bin $fish_user_paths
set -Ua fish_user_paths (pwd)/bin $fish_user_paths
set -Ua fish_user_paths ~/.asdf/shims ~/.asdf/bin $fish_user_paths
set -Ua fish_user_paths $HOME/.local/bin $fish_user_paths

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DOCKER_DEFAULT_PLATFORM=linux/amd64

function awsprofile
  export AWS_PROFILE=$(aws configure list-profiles | fzf)
  echo "Switched to $AWS_PROFILE"
end

function context
  set -l ctx (kubectl config get-contexts -o name | fzf)
  test -n "$ctx"; and kubectl config use-context "$ctx"
end

eval (direnv hook fish)

export TERM="xterm-256color"
