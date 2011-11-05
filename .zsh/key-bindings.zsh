typeset -g -A key

bindkey -e

bindkey "^[m" copy-prev-shell-word # file rename magick
bindkey ' ' magic-space # also do history expansion on space
bindkey '^[[Z' reverse-menu-complete

[[ -z "$terminfo[kpp]" ]] || bindkey "$terminfo[kpp]" up-history
[[ -z "$terminfo[knp]" ]] || bindkey "$terminfo[knp]" down-history
[[ -z "$terminfo[kdch1]" ]] || bindkey "$terminfo[kdch1]" delete-char
[[ -z "$terminfo[khome]" ]] || bindkey "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey "$terminfo[kend]" end-of-line

# bindkey -M vicmd "j" down-line-or-search
# bindkey -M vicmd "k" up-line-or-search

# bindkey -M vicmd '^[[A' up-line-or-search
# bindkey -M vicmd '^[[B' down-line-or-search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# bindkey -M vicmd "?" history-incremental-search-backward
# bindkey -M vicmd "/" history-incremental-search-forward

# general

bindkey "^[[3;3~" delete-word # alt+del
bindkey "^[[3;5~" delete-word # ctrl+del

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
bindkey '\e^[[D' tcsh-backward-word # tmux
# bindkey '\e[D' tcsh-backward-word # urxvt+fedora

tcsh-forward-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle emacs-forward-word
}
zle -N tcsh-forward-word
bindkey '\e[1;3C' tcsh-forward-word
bindkey '^[^[[C' tcsh-forward-word # tmux
# bindkey '\e[C' tcsh-forward-word # urxvt+fedora

tcsh-backward-delete-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle backward-delete-word
}
zle -N tcsh-backward-delete-word
bindkey "^[^?" tcsh-backward-delete-word # urxvt
