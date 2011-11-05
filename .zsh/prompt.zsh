autoload colors zsh/terminfo
colors

autoload -Uz promptinit
promptinit

# Erase the right prompt after a line is accepted
setopt transientrprompt

# Print the exit value for commands with non-zero exit status
setopt printexitvalue

setopt prompt_subst

# export PROMPT='
# ${SSH_TTY+"%n@%m:"}%3~$(prompt_git_info)$(rvm_info_for_prompt)
# %(!.#.>) '

export PROMPT='
${SSH_TTY+"%n@%m:"}%3~
#%h %(!.#.$) '

export RPROMPT='$(prompt_git_info)$(ruby_prompt_info)'

function ruby_prompt_info {
  # if [[ -n "$(which rbenv 2>/dev/null)" ]]; then
  #   ver=$(rbenv_ruby_ver)
  # else
    ver=$(rvm_ruby_ver)
  # fi

  if [ -n "$ver" ]; then
    echo "  %{${fg_bold[red]}%}★%{$reset_color%} $ver"
  fi
}

function rvm_ruby_ver {
  echo "$(~/.rvm/bin/rvm-prompt v p g)"
}

# function rbenv_ruby_ver {
#   echo "$(rbenv version | cut -f1 -d ' ')"
# }

# function vi_mode_info {
#   if [ -n "$VIMODE" ]; then
#     if [ "$VIMODE" != "-- INSERT --" ]; then
#       echo "  $VIMODE"
#     fi
#   fi
# }

# function zle-line-init zle-keymap-select {
#     VIMODE="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# function precmd_reset_vi_mode {
#   VIMODE=""
# }
# 
# precmd_functions+='precmd_reset_vi_mode'
