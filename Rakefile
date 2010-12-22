desc "Symlink configs and init git modules"
task :symlink_and_init_modules do
  entries = Dir["*"] + Dir[".*"] - [".", "..", ".git", "Rakefile", "README.md"]
  entries.each do |e|
    cmd = "ln -sfn #{File.expand_path(e)} ~/#{e}"
    puts cmd
    system cmd
  end
  system "git submodule update --init"
end

desc "Update vim plugins to latest rev"
task :update_modules do
  system "zsh -c 'cd .vim; for d (bundle/*) { [[ -d $d/.git ]] && (cd $d; git pull origin master) }'"
end

task :default => :symlink_and_init_modules
