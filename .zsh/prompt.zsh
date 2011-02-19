autoload colors zsh/terminfo
colors

autoload -Uz promptinit
promptinit

setopt prompt_subst

export PROMPT='${SSH_TTY+"%n@%m:"}%3~$(prompt_git_info) %(!.#.>) '
