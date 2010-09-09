typeset -g -A key

bindkey -e

bindkey "^[m" copy-prev-shell-word # file rename magick
bindkey ' ' magic-space # also do history expansion on space

bindkey '^[[5~' up-history
bindkey '^[[6~' down-history

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

bindkey '^[[H' beginning-of-line
bindkey '^[[7~' beginning-of-line
bindkey '^[[1~' beginning-of-line

bindkey '^[[F' end-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[4~' end-of-line

bindkey '\e[1;5D' backward-word
bindkey '\e[1;3D' backward-word
bindkey '^[^[[D' backward-word
bindkey '^[OD' backward-word

bindkey '\e[1;5C' forward-word
bindkey '\e[1;3C' forward-word
bindkey '^[^[[C' forward-word
bindkey '^[OC' forward-word

bindkey '^[[3~' delete-char

bindkey "^[[3;3~" delete-word
bindkey "^H" backward-delete-word
