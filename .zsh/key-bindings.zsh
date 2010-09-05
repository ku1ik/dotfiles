typeset -g -A key

bindkey `tput khome` beginning-of-line # HOME
bindkey `tput kend` end-of-line # END

bindkey ' ' magic-space    # also do history expansion on space

bindkey `tput kpp` up-history
bindkey `tput knp` end-of-history
bindkey `tput kcuu1` history-beginning-search-backward
bindkey `tput kcud1` history-beginning-search-forward

# urxvt
bindkey '^?' backward-delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[8~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
bindkey '^[[2~' overwrite-mode
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey "^H" backward-delete-word

# konsole

bindkey '\e[1;5C' forward-word        # ctrl right
bindkey '\e[1;5D' backward-word       # ctrl left

# bindkey '^[Od' backward-word
# bindkey '^[[Od' backward-word
# bindkey '^[Oc' forward-word
# bindkey '^[[Oc' forward-word

# bindkey ';5C' forward-word
# bindkey ';3C' forward-word
# bindkey ';5D' backward-word
# bindkey ';3D' backward-word
# bindkey '\eOc'    forward-word        # ctrl right
# bindkey '\eOd'    backward-word       # ctrl left

# bindkey "\e[5D" backward-word
# bindkey "\ee[D" backward-word

