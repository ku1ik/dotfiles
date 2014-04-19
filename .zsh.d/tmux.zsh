alias tn='tmux new -s'
alias ta='tmux attach -t'

if [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]]; then
  source $HOME/.tmuxinator/scripts/tmuxinator
fi

compctl -g '~/.tmuxinator/*(:t:r)' mux tmuxinator
