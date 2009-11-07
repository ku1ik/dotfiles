local USER_COLOR=$'%{\e[38;5;197m%}'
#local PWD_COLOR=$'%{\e[37m%}'
local PWD_COLOR=$'%{\e[38;5;149m%}'
local HOST_COLOR=$'%{\e[38;5;208m%}'
local AT_COLOR=$'%{\e[37m%}'
local BRANCH_COLOR=$'%{\e[38;5;33m%}'

export PROMPT_TEMPLATE="$USER_COLOR%n$AT_COLOR@$HOST_COLOR%m $PWD_COLOR%3~ %{$fg_bold[yellow]%}%#%{$reset_color%} "
export RPROMPT_TEMPLATE="\${GIT_INFO}(%(?..%{$fg[red]%})%T)%{$reset_color%}"
#export RPROMPT="%(?..%{$fg[red]%})%T%{$reset_color%}"

