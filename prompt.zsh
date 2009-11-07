local USER_COLOR=$'%{\e[38;5;197m%}'
local PWD_COLOR=$'%{\e[38;5;149m%}'
local HOST_COLOR=$'%{\e[38;5;208m%}'
local AT_COLOR=$'%{\e[1;37m%}'
local BRANCH_COLOR=$'%{\e[38;5;33m%}'

export PROMPT_TEMPLATE="%B$USER_COLOR%n$AT_COLOR@$HOST_COLOR%m $PWD_COLOR%3~%{$reset_color%}\$GIT_INFO %{$fg_bold[yellow]%}%#%{$reset_color%} "
export RPROMPT="%(?..%{$fg[red]%})%T%{$reset_color%}"

