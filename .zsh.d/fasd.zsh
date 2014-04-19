if which fasd &>/dev/null; then
  eval "$(fasd --init auto)"

  alias j='fasd_cd -d'
  alias vv='f -e vim'
  alias o='a -e xdg-open'
  alias m='f -e mplayer'
fi
