source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

function ruby_ver {
  echo $RUBY_VERSION
}

compctl -g '~/.rubies/*(:t)' chruby
