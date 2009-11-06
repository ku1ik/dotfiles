autoload -U zgitinit
zgitinit

precmd_functions+='my_precmd'

my_precmd() {
  psvar=()
  psvar[1]="$(git_prompt)"
}

git_info() {
  echo "$(git_branch)$(git_status)"
}

git_branch() {
  echo "$(zgit_branch)"
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
    
    echo "${(j::)st}"
  fi
}

git_prompt() {
  zgit_isgit || return
  echo ":$(git_info)"
}

