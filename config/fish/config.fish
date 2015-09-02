alias dev="cd ~/src"
alias s="git status"
alias tstart="/Applications/tomcat/bin/startup.sh"
alias tstop="/Applications/tomcat/bin/shutdown.sh"
alias antlog="ant; tstop; tstart; tail -f /Applications/tomcat/logs/catalina.out"
alias flush='echo "flush_all" | nc localhost 11211'

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

chruby ruby-2.1.6

source ~/.config/fish/functions/git.fish
source ~/.config/fish/functions/weather.fish

set -gx PATH $HOME/go/bin $PATH
set -gx GOPATH $HOME/go
function fish_prompt
  if test -d .git
    printf '%s%s%s:%s> ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '%s%s%s> ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end

function fish_greeting
  set_color green
  print_weather | cowsay
end
