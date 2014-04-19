typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

update_current_git_vars() {
  unset __CURRENT_GIT_BRANCH
  unset __CURRENT_GIT_BRANCH_STATUS
  unset __CURRENT_GIT_BRANCH_HAS_UNTRACKED
  unset __CURRENT_GIT_BRANCH_HAS_MODIFIED
  unset __CURRENT_GIT_BRANCH_HAS_DELETED
  unset __CURRENT_GIT_BRANCH_HAS_STAGED

  local st="$(git status 2>/dev/null)"
  if [[ -n "$st" ]]; then
    local -a arr
    arr=(${(f)st})

    if [[ $arr[1] =~ 'Not currently on any branch.' ]]; then
      __CURRENT_GIT_BRANCH='no-branch'
    else
      __CURRENT_GIT_BRANCH="${arr[1][(w)4]}";
    fi

    if [[ $arr[2] =~ 'Your branch is' ]]; then
      if [[ $arr[2] =~ 'ahead' ]]; then
        __CURRENT_GIT_BRANCH_STATUS='ahead'
      elif [[ $arr[2] =~ 'behind' ]]; then
        __CURRENT_GIT_BRANCH_STATUS='behind'
      elif [[ $arr[2] =~ 'diverged' ]]; then
        __CURRENT_GIT_BRANCH_STATUS='diverged'
      fi
    fi

    if [[ $st =~ 'to be committed' ]]; then
      __CURRENT_GIT_BRANCH_HAS_STAGED='1'
    fi

    if [[ $st =~ 'modified:' ]]; then
      __CURRENT_GIT_BRANCH_HAS_MODIFIED='1'
    fi

    if [[ $st =~ 'deleted:' ]]; then
      __CURRENT_GIT_BRANCH_HAS_DELETED='1'
    fi

    if [[ $st =~ 'Untracked files' ]]; then
      __CURRENT_GIT_BRANCH_HAS_UNTRACKED='1'
    fi
  fi
}

prompt_git_info() {
  if [ -n "$__CURRENT_GIT_BRANCH" ]; then
    local s=""

    s+="$__CURRENT_GIT_BRANCH"

    case "$__CURRENT_GIT_BRANCH_STATUS" in
      ahead)
      s+="»"
      ;;
      diverged)
      s+="»«"
      ;;
      behind)
      s+="«"
      ;;
    esac

    if [ -n "$__CURRENT_GIT_BRANCH_HAS_STAGED" ]; then
      s+="%F{yellow}+%f"
    fi

    if [ -n "$__CURRENT_GIT_BRANCH_HAS_MODIFIED" ]; then
      s+="%F{green}*%f"
    fi

    if [ -n "$__CURRENT_GIT_BRANCH_HAS_DELETED" ]; then
      s+="%F{red}-%f"
    fi

    if [ -n "$__CURRENT_GIT_BRANCH_HAS_UNTRACKED" ]; then
      s+="%F{blue}?%f"
    fi

    print "%F{yellow}($s%F{yellow})%f "
  fi
}

preexec_update_git_vars() {
  [[ $1 =~ ^(git|g.{0,2})(\\s|$) ]] && __EXECUTED_GIT_COMMAND=1
}

precmd_update_git_vars() {
  if [ -n "$__EXECUTED_GIT_COMMAND" ]; then
    update_current_git_vars
    unset __EXECUTED_GIT_COMMAND
  fi
}

chpwd_update_git_vars() {
  update_current_git_vars
}

preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

update_current_git_vars

alias g='git'
alias gcd='cd "`git rev-parse --show-toplevel`"' # Go to the root of a Git repo
