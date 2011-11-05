## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

setopt long_list_jobs

# edit command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "\ee" edit-command-line  # <Esc-e>

export REPORTTIME=60

# disable XON/XOFF flow control (^s/^q)
stty -ixon
