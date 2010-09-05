function git(){hub $@}

export __ZSH_GIT_BRANCH=
export __ZSH_GIT_INVALIDATE=1

typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

git_parse_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

git_compute_vars() {
  export __ZSH_GIT_BRANCH="$(git_parse_branch)"
  export __ZSH_GIT_INVALIDATE=
}

# on each chdir update the cached git variable(s)
preexec_functions+='git_preexec_update_vars'
chpwd_functions+='git_chpwd_update_vars'
precmd_functions+='git_precmd_update_vars'

git_precmd_update_vars() {
  test -n "$__ZSH_GIT_INVALIDATE" && git_compute_vars
}

git_chpwd_update_vars() {
  export __ZSH_GIT_INVALIDATE=1
}

git_preexec_update_vars() {
  case "$(history $HISTCMD)" in 
    *git\ *)  export __ZSH_GIT_INVALIDATE=1 ;;
    *g\ *)  export __ZSH_GIT_INVALIDATE=1 ;;
  esac
}

git_prompt_info() {
  echo $__ZSH_GIT_BRANCH
}

#git_compute_vars

