autoload colors zsh/terminfo
colors

autoload -Uz promptinit
promptinit

# Erase the right prompt after a line is accepted
setopt transientrprompt

# Eval expressions (vars) in prompt string
setopt prompt_subst

PROMPT="\
%F{blue}${SSH_TTY+%n@%m:}%2~%f \
\$(prompt_git_info)\
%(0?..%F{red})%%%(1j.%%.)%f "
export PROMPT

# export RPROMPT='$(prompt_git_info)$(ruby_prompt_info)'
export RPROMPT='$(ruby_prompt_info)'

function ruby_prompt_info {
  ver=$(rvm_ruby_ver 2>/dev/null)

  if [ -z "$ver" ]; then
    ver=$(rbenv_ruby_ver 2>/dev/null)
  fi

  if [ -n "$ver" ]; then
    echo "%F{red}($ver)%f "
  fi
}

function rvm_ruby_ver {
  echo "$(~/.rvm/bin/rvm-prompt v p g)"
}

function rbenv_ruby_ver {
  echo "$(rbenv version-name)"
}
