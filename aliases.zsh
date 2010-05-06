alias l='ls -lah --color=auto'
# alias lsa='ls -la --color=auto'
alias ll='ls -ltc --color=auto | head'
alias grep='grep --color'
alias sk='ssh -l kill sickill.net'
alias deneb='ssh -l rubydev deneb.llp.pl'
alias deneb-admin='ssh -l llpadmin deneb.llp.pl'
alias hydra='ssh -l rubydev hydra.llp.pl'
alias psg='ps aux | grep'
alias psug='ps ux | grep'
alias rtorrent='screen -D -R rtorrent rtorrent'
alias tailf='tail -f -n200'
alias rdbm='rake db:migrate'
alias _='sudo'

alias g='git'
alias gl='git pull'
alias gp='git push'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gs='git status'
alias gd='git diff'

alias md='mkdir -p'

alias sp='spec -c'

alias killmerb='ps ax | grep merb | cut -f1 -d"p" | xargs kill -9'
alias m='bin/merb'
alias mi='bin/merb -i'

alias sc='./script/rails console'
alias ss='./script/rails server'
alias u='unicorn -p 3000'

alias be='bundle exec'
alias ber='bundle exec rake'
alias bes='bundle exec spec'
alias bi='bundle install'

alias vim=rungvim.rb
alias gvim=rungvim.rb
