# zstyle :compinstall filename "${HOME}/.zshrc"

autoload -U compinit
compinit

zmodload zsh/complist

setopt complete_in_word
# setopt MENU_COMPLETE # immediatelly insert first match

# Processes
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -ux'

zstyle ':completion:*' users off
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

zstyle ':completion:*' accept-exact '*(N)'

# zstyle ':completion:*:processes-names' command  'ps c -au ${USER} -o command | uniq'
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
