# typeset -g -A key

bindkey "^[m" copy-prev-shell-word # file rename magick
bindkey ' ' magic-space # also do history expansion on space
bindkey '^[[Z' reverse-menu-complete

[[ -z "$terminfo[kpp]" ]] || bindkey "$terminfo[kpp]" up-history
[[ -z "$terminfo[knp]" ]] || bindkey "$terminfo[knp]" down-history
[[ -z "$terminfo[kdch1]" ]] || bindkey "$terminfo[kdch1]" delete-char
[[ -z "$terminfo[khome]" ]] || bindkey "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey "$terminfo[kend]" end-of-line

# TODO: use $terminfo also for below

bindkey '^[[A' up-line-or-search
bindkey '^[OA' up-line-or-search # Ubuntu 12.10
bindkey '^[[B' down-line-or-search
bindkey '^[OB' down-line-or-search # Ubuntu 12.10

bindkey "^[[3;3~" delete-word # alt+del
bindkey "^[[3;5~" delete-word # ctrl+del
bindkey "^[[3^" delete-word   # ctrl+del

bindkey '\e[1;5D' backward-word # urxvt, konsole
bindkey '^[Od' backward-word # urxvt

bindkey '\e[1;5C' forward-word # urxvt, konsole
bindkey '^[Oc' forward-word # urxvt

tcsh-backward-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle emacs-backward-word
}
zle -N tcsh-backward-word
bindkey '\e[1;3D' tcsh-backward-word
bindkey '\e^[[D' tcsh-backward-word # tmux

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
