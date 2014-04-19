function prepend_binstubs_path {
  path=(/proc/self/cwd/.bundle/bin "$path[@]")
}

precmd_functions+=("prepend_binstubs_path")

alias be='bundle exec'
