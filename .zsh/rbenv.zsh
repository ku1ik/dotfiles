if [[ -d "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"

  # eval "$(rbenv init -)"
  export PATH="/home/kill/.rbenv/shims:${PATH}"
  source "/home/kill/.rbenv/libexec/../completions/rbenv.zsh"
  # rbenv rehash 2>/dev/null
  rbenv() {
    local command="$1"
    if [ "$#" -gt 0 ]; then
      shift
    fi

    case "$command" in
    shell)
      eval `rbenv "sh-$command" "$@"`;;
    *)
      command rbenv "$command" "$@";;
    esac
  }
fi
