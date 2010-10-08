typeset -g -A key

bindkey -e

bindkey "^[m" copy-prev-shell-word # file rename magick
bindkey ' ' magic-space # also do history expansion on space

bindkey '^[[5~' up-history
bindkey '^[[6~' down-history

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

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

tcsh-backward-delete-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle backward-delete-word
}
zle -N tcsh-backward-delete-word
bindkey "^H" tcsh-backward-delete-word
