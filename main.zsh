setopt nohup
setopt nobeep
setopt extendedglob
setopt NOBGNICE
setopt autocd

fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

. ~/.zsh/completion.zsh
. ~/.zsh/key-bindings.zsh
. ~/.zsh/aliases.zsh
. ~/.zsh/exports.zsh
. ~/.zsh/git.zsh
. ~/.zsh/colors.zsh
. ~/.zsh/termsupport.zsh
. ~/.zsh/rake_completion.zsh
. ~/.zsh/misc.zsh
. ~/.zsh/history.zsh

