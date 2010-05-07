typeset -g -A key

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

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

#bindkey '^[Od' backward-word
#bindkey '^[[Od' backward-word
#bindkey ';5D' backward-word
#bindkey ';3D' backward-word
#bindkey '^[Oc' forward-word
#bindkey '^[[Oc' forward-word
#bindkey ';5C' forward-word
#bindkey ';3C' forward-word

#bindkey '\eOc'    forward-word        # ctrl right
#bindkey '\eOd'    backward-word       # ctrl left

#bindkey "\e[5D" backward-word
#bindkey "\ee[D" backward-word

#bindkey '\e[1;5C' forward-word        # ctrl right
#bindkey '\e[1;5D' backward-word       # ctrl left

