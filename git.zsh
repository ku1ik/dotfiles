autoload -U zgitinit
zgitinit

precmd_functions+='my_precmd'

my_precmd() {
  psvar=()
  psvar[1]="$(git_prompt)"
}

git_prompt() {
  if [ zgit_branch = "" ]; then
    echo ""
  else
    echo ":$(zgit_branch)"
  fi
}

