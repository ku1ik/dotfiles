autoload colors zsh/terminfo
colors

autoload -Uz promptinit
promptinit

# Erase the right prompt after a line is accepted
setopt transientrprompt

# Eval expressions (vars) in prompt string
setopt prompt_subst

PROMPT="\
%F{cyan}${SSH_TTY+%n@%m:}%2~%f \
\$(ruby_prompt_info)\
\$(prompt_git_info)\
%(0?..%F{red})%%%(1j.%%.)%f "
export PROMPT

# export RPROMPT='$(prompt_git_info)$(ruby_prompt_info)'

function ruby_prompt_info {
  ver=$(rvm_ruby_ver &>/dev/null)

  if [ -n "$ver" ]; then
    echo "%F{red}($ver)%f "
  fi
}

function rvm_ruby_ver {
  echo "$(~/.rvm/bin/rvm-prompt v p g)"
}
