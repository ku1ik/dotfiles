autoload -U compinit
compinit -i

setopt complete_in_word

# Completion algorithms
zstyle ':completion:*' completer _complete _prefix

# Rehash when completing commands
zstyle ":completion:*:commands" rehash 1

# Ignore internal zsh functions
zstyle ':completion:*:functions' ignored-patterns '_*'

# Smart case matching && match inside filenames
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colors in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Grouping of completion sources
zstyle ':completion:*:descriptions' format "%{${fg_bold[magenta]}%}= %d =%{$reset_color%}"
zstyle ':completion:*' group-name ""

# Speedup path completion
zstyle ':completion:*' accept-exact '*(N)'

# Cache expensive completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# List all processes for killall
zstyle ':completion:*:processes-names' command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"

# Process completion shows all processes with colors
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' command 'ps -A -o pid,user,cmd'
zstyle ':completion:*:*:*:*:processes' list-colors "=(#b) #([0-9]#)*=0=${color[green]}"
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'
