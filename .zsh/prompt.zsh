setopt prompt_subst

ssh_host() {
  [[ -n $SSH_TTY ]] && print "%n@%m:"
}

export PROMPT='$(ssh_host)%3~$(prompt_git_info) %(!.#.>) '
