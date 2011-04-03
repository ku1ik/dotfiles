autoload colors zsh/terminfo
colors

autoload -Uz promptinit
promptinit

# Erase the right prompt after a line is accepted
# setopt transientrprompt

# Print the exit value for commands with non-zero exit status
# setopt printexitvalue

setopt prompt_subst

export PROMPT='
${SSH_TTY+"%n@%m:"}%3~$(prompt_git_info)$(rvm_info_for_prompt)
%(!.#.>) '

# this tests for the presence of rvm 
# if its loaded, it'll add the prompt
function rvm_info_for_prompt {
  ruby_version=$(~/.rvm/bin/rvm-prompt)
  if [ -n "$ruby_version" ]; then
    echo " [$ruby_version]"
  fi
}
