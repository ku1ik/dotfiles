desc "Install"
task :install do
  entries = Dir["*"] + Dir[".*"] - [".", "..", ".git", "Rakefile", "README.md"]
  entries.each do |e|
    cmd = "ln -sfn #{File.expand_path(e)} ~/#{e}"
    puts cmd
    system cmd
  end
  system "git submodule update --init"
end

task :default => :install
