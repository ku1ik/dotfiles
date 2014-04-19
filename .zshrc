# make $PATH a set
typeset -U path
export PATH="$HOME/.local/bin:$PATH"

autoload colors zsh/terminfo
colors

setopt nohup
setopt nobeep
setopt extendedglob
unsetopt nomatch # pass the bad match onto the command
setopt nobgnice
setopt autocd
setopt autopushd

# auto-quote entered URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# edit command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "\ee" edit-command-line  # <Esc-e>

# display time for longer commands
export REPORTTIME=60

# disable XON/XOFF flow control (^s/^q)
stty -ixon

# enable zmv (mv on steroids)
autoload -U zmv

for file in ~/.zsh.d/*.zsh; do
  . $file
done

[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local
