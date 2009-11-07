autoload -U zgitinit
zgitinit

precmd_functions+='my_precmd'

my_precmd() {
  GIT_INFO=$(git_prompt)
  eval "export PROMPT=\"$PROMPT_TEMPLATE\""
  eval "export RPROMPT=\"$RPROMPT_TEMPLATE\""
}

git_prompt() {
  zgit_isgit || return
  echo -ne "($(git_branch)$(git_status)%{$reset_color%})"
}

git_branch() {
  echo -ne "$BRANCH_COLOR%U$(zgit_branch)%u"
}

git_status() {
  local -a st

  if zgit_inworktree; then
    if ! zgit_isindexclean; then
      st+="%{$fg_bold[green]%}+"
    fi
    
    if ! zgit_isworktreeclean; then
      st+="%{$fg_bold[red]%}!"
    fi
    
    if zgit_hasunmerged; then
      st+='*'
    fi
    
    if zgit_hasuntracked; then
      st+="%{$fg_bold[red]%}?"
    fi
    
    echo -ne "${(j::)st}"
  fi
}

