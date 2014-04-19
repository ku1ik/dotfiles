function _cap_does_task_list_need_generating () {
  if [[ ! -f .cap_tasks~ ]]; then return 0;
  else
    latest=$(ls -1c Capfile config/deploy.rb config/deploy/*.rb 2>/dev/null | head -1)
    accurate=$(stat -c "%Y" .cap_tasks~)
    changed=$(stat -c "%Y" $latest)
    return $(expr $accurate '>=' $changed)
  fi
}

function _cap () {
  if [[ -f config/deploy.rb ]]; then
    if _cap_does_task_list_need_generating; then
      cap -T -t | cut -d " " -f 2 > .cap_tasks~
      (cd config/deploy 2>/dev/null && ls -1 *.rb | cut -d '.' -f 1) >> .cap_tasks~
    fi
    compadd $(cat .cap_tasks~)
  fi
}

compdef _cap cap
