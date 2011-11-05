setopt nohup
setopt nobeep
setopt extendedglob
setopt NOBGNICE
setopt autocd
setopt autopushd

. ~/.zsh/completion.zsh
. ~/.zsh/key-bindings.zsh
. ~/.zsh/env.zsh
. ~/.zsh/aliases.zsh
. ~/.zsh/termsupport.zsh
. ~/.zsh/misc.zsh
. ~/.zsh/history.zsh
. ~/.zsh/git.zsh
. ~/.zsh/prompt.zsh
. ~/.zsh/rvm.zsh
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local
