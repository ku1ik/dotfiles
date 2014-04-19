_rake_does_task_list_need_generating() {
  if [[ ! -f .rake_tasks~ ]]; then return 0;
  else
    latest=$(ls -1c Rakefile lib/tasks/*.rake Gemfile.lock 2>/dev/null | head -1)
    accurate=$(stat -c "%Y" .rake_tasks~)
    changed=$(stat -c "%Y" $latest)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake() {
  if [[ -f Rakefile ]]; then
    if _rake_does_task_list_need_generating; then
      rake --silent --tasks 2>/dev/null | cut -d " " -f 2 | cut -d "[" -f 1 > .rake_tasks~
    fi
    compadd $(cat .rake_tasks~)
  fi
}

compdef _rake rake
