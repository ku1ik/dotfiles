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

bindkey '^[[3~' delete-char
bindkey "^[[3;3~" delete-word
bindkey "^[" delete-word

bindkey '\e[1;5D' backward-word # urxvt, konsole
bindkey '^[OD' backward-word # tmux
bindkey '^[Od' backward-word # urxvt

bindkey '\e[1;5C' forward-word # urxvt, konsole
bindkey '^[OC' forward-word # tmux
bindkey '^[Oc' forward-word # urxvt

# bindkey "^?" backward-delete-word # gnome-term/terminator
bindkey "^H" backward-delete-word # urxvt

tcsh-backward-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle emacs-backward-word
}
zle -N tcsh-backward-word
bindkey '\e[1;3D' tcsh-backward-word
bindkey '^[^[[D' tcsh-backward-word # tmux

tcsh-forward-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle emacs-forward-word
}
zle -N tcsh-forward-word
bindkey '\e[1;3C' tcsh-forward-word
bindkey '^[^[[C' tcsh-forward-word # tmux

tcsh-backward-delete-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle backward-delete-word
}
zle -N tcsh-backward-delete-word
bindkey "^[^?" tcsh-backward-delete-word # urxvt
