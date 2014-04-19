case "$TERM" in
  xterm*|rxvt*)
    preexec () {
      print -Pn "\e]0;%~: $1\a"  # xterm
    }

    precmd () {
      print -Pn "\e]0;%~\a"  # xterm
      echo -ne '\a'
    }
    ;;
esac
