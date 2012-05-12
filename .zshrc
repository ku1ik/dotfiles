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
. ~/.zsh/scratch.zsh
. ~/.zsh/rake.zsh
. ~/.zsh/capistrano.zsh

[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh
