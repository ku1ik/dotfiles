autoload -U zgitinit
zgitinit

precmd_functions+='my_precmd'

my_precmd() {
  GIT_INFO=$(git_prompt)
  eval "export PS1=\"$PROMPT_TEMPLATE\""
}

git_prompt() {
  zgit_isgit || return
  echo -ne ":$(git_branch)$(git_status)%{$reset_color%}"
}

git_branch() {
  echo -ne "%{$fg_bold[cyan]%}$(zgit_branch)"
}

git_status() {
  local -a st

  if zgit_inworktree; then
    if ! zgit_isindexclean; then
      st+='+'
    fi
    
    if ! zgit_isworktreeclean; then
      st+='!'
    fi
    
    if zgit_hasunmerged; then
      st+='*'
    fi
    
    if zgit_hasuntracked; then
      st+='?'
    fi
    
    echo -ne "%{$fg_bold[red]%}${(j::)st}"
  fi
}

