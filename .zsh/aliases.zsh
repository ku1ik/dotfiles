alias l='ls -lah --color=auto --file-type'
# alias lsa='ls -la --color=auto'
alias ll='ls -ltc --color=auto | head'
alias grep='grep --color'
alias sk='ssh -l kill sickill.net'
alias deneb='ssh -l rubydev deneb.llp.pl'
alias deneb-admin='ssh -l llpadmin deneb.llp.pl'
alias hydra='ssh -l rubydev hydra.llp.pl'
alias psg='ps aux | grep'
alias psug='ps ux | grep'
alias rtorrent='tmux attach -t rtorrent || tmux new -s rtorrent rtorrent'
alias tailf='tail -f -n200'
alias _='sudo'

alias g='git'
alias gl='git pull --rebase'
alias gp='git push'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gs='git status -sb'
alias gd='git diff'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

alias md='mkdir -p'

alias rdbm='rake db:migrate'
alias r=rails
alias u='unicorn -p 3000'
alias rs='tail -f -n0 log/development.log&; thin start; killall tail'

alias bi='bundle install'

alias gvim=rungvim.rb
alias man='man -P less'
alias sv='sudo service'

if $(grc &>/dev/null)
then
  alias ping='grc ping'
  alias diff='grc diff'
fi

alias -g G='| grep'
alias -g L='| less'
alias -g M='| more'
alias -g T='| tail'
alias -g TF='tail -n100 -f'

alias ff='find . -type f -iname $1'
alias fd='find . -type d -iname $1'

alias t='todo.sh'
