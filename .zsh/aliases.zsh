alias l='ls -lah --color=auto --file-type'
# alias lsa='ls -la --color=auto'
alias ll='ls -ltc --color=auto | head'
alias grep='grep --color'
alias sk='ssh -l kill sickill.net'
alias deneb='ssh -l rubydev deneb.llp.pl'
alias deneb-admin='ssh -l llpadmin deneb.llp.pl'
alias hydra='ssh -l rubydev hydra.llp.pl'
alias psg='ps ax | grep'
alias psug='ps x | grep'
alias rtorrent='tmux attach -t rtorrent || tmux new -s rtorrent rtorrent'
alias tailf='tail -f -n200'
alias _='sudo'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gd='git diff'
alias gl='git pull --rebase'
alias go='git checkout'
alias gp='git push'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gs='git status -sb'

alias md='mkdir -p'

alias b=bundle
alias be='bundle exec'
alias rdbm='bundle exec rake db:migrate'
alias r='bundle exec rails'
alias rc='bundle exec rails c'
alias rs='bundle exec rails s thin'
alias rspec='bundle exec rspec'
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
alias tmux='tmux -2'
alias ducks='du -cks * | sort -rn | head -11' # Lists the size of all the folders and files

alias jsonpretty='ruby -rap -rjson -e "ap JSON.parse(STDIN.read)"'

alias cls="echo -ne '\033c'"
