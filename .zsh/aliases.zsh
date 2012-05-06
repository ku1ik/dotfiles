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
alias psug='ps x | grep -i'
alias psg='ps aux | grep -i'

# TODO: split config by use cases rather than by zsh shell features
function psk() {
  ps aux | grep -i $1 | grep -v grep | awk '{ print $2 } ' | xargs kill
}

# opening files
alias open='xdg-open'
alias o='xdg-open'
alias -s -- jar='java -jar'

# pkg managers
alias a='sudo apt-get'
alias y='sudo yum'
alias yl='yum -C list installed'
alias ys='sudo yum -C search'

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

# rails
alias r='./script/rails'
alias rc='./script/rails c'
alias rs='./script/rails s'
alias rg='./script/rails g'
alias rdbm='rake db:migrate'
alias rdbmt='RAILS_ENV=test rdbm'
alias devlog='tail -f -n300 log/development.log' #'less +F -r log/development.log'
gemcd() { cd "$(gem open -e echo $1)" }
alias bib='bundle install --binstubs'
alias rake='noglob rake' # stop rake's params from being treated as ZSH patterns

# vagrant
alias vg='vagrant'
alias vu='vagrant up'

# editing
alias v=vim
alias e=gvim
alias view='vim -R'
alias vime="vim -u ~/.vimencrypt -x"

# find stuff
alias fd='find . -type d -iname $1'
alias ff='find . -type f -iname $1'
alias unsvn='find . -name .svn -print0 | xargs -0 rm -rf'

# tmux
alias t=tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'

# other
alias bc='bc -q'
alias cls="echo -ne '\033c'"
alias dl='cd ~/Downloads'
alias jsonpretty='python -mjson.tool'
alias man='man -P less'
alias myip='curl http://whatismyip.org && echo'
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr" # useful command to find what you should be aliasing:
alias rtorrent='tmux attach -t rtorrent || tmux new -s rtorrent rtorrent'
alias weechat='tmux attach -t weechat || tmux new -s weechat weechat-curses'
alias s='sudo'
alias please='sudo !!'
alias sv='sudo service'
alias t='todo.sh'
alias tf='tail -f -n200'
alias x='dtrx -v --one=here'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias mc='TERM=xterm mc'
alias ssh='TERM=xterm ssh'
alias smtpd='python -m smtpd -n -c DebuggingServer localhost:1025'
alias beep='echo -n "\a"'

# global aliases
alias -g G='| grep'
alias -g L='| less'
alias -g M='| more'
alias -g T='| tail'
alias -g TF='tail -n100 -f'

alias lasciiio="ASCII_IO_API_URL=http://127.0.0.1:3000 asciiio"
