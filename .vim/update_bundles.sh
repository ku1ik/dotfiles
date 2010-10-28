#!/bin/zsh

for d (bundle/*) { [[ -d $d/.git ]] && (cd $d; git pull origin master; cd -) }
