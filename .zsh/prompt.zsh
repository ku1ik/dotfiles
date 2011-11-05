autoload colors zsh/terminfo
colors

autoload -Uz promptinit
promptinit

# Erase the right prompt after a line is accepted
setopt transientrprompt

# Print the exit value for commands with non-zero exit status
setopt printexitvalue

# Eval expressions (vars) in prompt string
setopt prompt_subst

export PROMPT='
${SSH_TTY+"%n@%m:"}%3~
#%h %(!.#.$) '

export RPROMPT='$(prompt_git_info)$(ruby_prompt_info)'

function ruby_prompt_info {
  ver=$(rvm_ruby_ver)

  if [ -n "$ver" ]; then
    echo "  %{${fg_bold[red]}%}★%{$reset_color%} $ver"
  fi
}

function rvm_ruby_ver {
  echo "$(~/.rvm/bin/rvm-prompt v p g)"
}
