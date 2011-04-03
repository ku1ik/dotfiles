## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

setopt long_list_jobs

setopt correct # correct typos

# edit command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "\ee" edit-command-line  # <Esc-e>

eval $(lesspipe)
