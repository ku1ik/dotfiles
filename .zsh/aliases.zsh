alias reload!='source ~/.zshrc'

# filesystem
alias ls='ls -ahF --color=auto'
alias ll='ls -la'
alias lsd='ls -l | grep "^d"' # list dirs
alias ..='cd ..;' # can then do .. .. .. to move up multiple directories.
alias ...='.. ..'
alias cd-='cd;cd -'
alias df='df -h'
alias du='du -chs'
alias md='mkdir -p'
alias ducks='du -cks * | sort -rn | head -11' # Lists the size of all the folders and files

# processes
alias psg='ps ax | grep'
alias psug='ps x | grep'

# opening files
alias open='xdg-open'
alias o='xdg-open'
alias -s -- jar='java -jar'

# pkg managers
alias a='sudo apt-get'
alias y='sudo yum'
alias yl='yum -C list installed'
alias ys='yum -C search'

# git
alias g='git'

alias ga='g a'
alias gau='g au'
alias gaa='g aa'
# alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

alias gb='g b'

alias gc='g c'
alias gc-='g c-'
alias gca='g ca'
alias gcu='g cu'

alias gs='g s'
alias gd='g d'

alias gco='g co'

alias gl='git pull'
alias glr='git pull --rebase'
alias gp='git push origin HEAD'

# bundler
alias b='bundle'
alias be='bundle exec'
alias bu='bundle update'

# rails
alias r='rails'
alias rc='rails c'
alias rs='rails s'
alias rg='rails g'
alias rdbm='rake db:migrate'
alias rdbmt='RAILS_ENV=test rdbm'
alias devlog='tail -f -n 300 log/development.log'
gemcd() { cd "$(gem open -e echo $1)" }

# vagrant
alias vg='vagrant'
alias vu='vagrant up'

# editing
alias v=vim.basic
alias e=gvim

# find stuff
alias fd='find . -type d -iname $1'
alias ff='find . -type f -iname $1'
alias unsvn='find . -name .svn -print0 | xargs -0 rm -rf'

# other
alias bc='bc -q'
alias cls="echo -ne '\033c'"
alias dl='cd ~/Downloads'
alias jsonpretty='python -mjson.tool'
alias man='man -P less'
alias myip='curl http://whatismyip.org && echo'
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr" # useful command to find what you should be aliasing:
alias rtorrent='tmux attach -t rtorrent || tmux new -s rtorrent rtorrent'
alias s='sudo'
alias sv='sudo service'
alias t='todo.sh'
alias tf='tail -f -n200'
alias x='dtrx -v --one=here'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g M='| more'
alias -g T='| tail'
alias -g TF='tail -n100 -f'
