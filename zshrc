ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git osx terminalapp)

source $ZSH/oh-my-zsh.sh

alias dev="cd /Users/Tristan/Documents/Development"
alias s="clear && git status"

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export GOPATH=$HOME/go
export EDITOR=vim

# memcached
alias restart_memcached='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'

# php55
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"

# virtualenv for cw deployment script
export VIRTUAL_ENV_DISABLE_PROMPT=0
source /Users/tristanoneil/src/cw_deployment_script/bin/activate

# add cw_common cake to path
export PATH=/Users/tristanoneil/src/cw_common/code/php/cakephp/cake/console/:$PATH

# rbenv init
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"

# mycw
alias tstart='/Applications/tomcat/bin/startup.sh'
alias tstop='/Applications/tomcat/bin/shutdown.sh'
alias mycw_mem='memcached -u memcached  -m 512 -l 127.0.0.1 -p 11211'
alias antlog='ant; tstop; tstart; tail -f /Applications/tomcat/logs/catalina.out'
