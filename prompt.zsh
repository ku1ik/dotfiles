local USER_COLOR=$'%B%{\e[38;5;30m%}'
local AT_COLOR=$'%B%{\e[38;5;71m%}'
local HOST_COLOR=$'%B%{\e[38;5;71m%}'
local PWD_COLOR="%b%{$reset_color%}"
#$'%b%{\e[38;5;144m%}'
local GIT_BRANCH_COLOR=$'%B%{\e[38;5;29m%}'
local GIT_STATUS_ONE="%B%{$fg[yellow]%}"
local GIT_STATUS_TWO="%B%{$fg[green]%}"
local GIT_STATUS_THREE="%B%{$fg[cyan]%}"

export PROMPT="$USER_COLOR%n$AT_COLOR@$HOST_COLOR%m $PWD_COLOR%3~ %{$fg_bold[white]%}%#%{$reset_color%} "
export RPROMPT_TEMPLATE='$(git_prompt)'

autoload -U zgitinit
zgitinit

precmd_functions+='my_precmd'

my_precmd() {
  eval "export RPROMPT=\"$RPROMPT_TEMPLATE\""
}

git_prompt() {
  zgit_isgit || return
  echo -ne "[$(git_branch)$(git_status)%{$reset_color%}]"
}

git_branch() {
  echo -ne "$GIT_BRANCH_COLOR$(zgit_branch)"
}

git_status() {
  local -a st

  if zgit_inworktree; then
    st+="$GIT_STATUS_ONE"
    if ! zgit_isindexclean; then
      st+="+"
    #else
    #  st+=" "
    fi
    
    st+="$GIT_STATUS_TWO"
    if ! zgit_isworktreeclean; then
      st+="!"
    #else
    #  st+=" "
    fi
    
    if zgit_hasunmerged; then
      st+='*'
    fi
    
    st+="$GIT_STATUS_THREE"
    if zgit_hasuntracked; then
      st+="?"
    #else
    #  st+=" "
    fi
    
    echo -ne "${(j::)st}"
  fi
}

