desc "Install"
task :install do
  entries = Dir["*"] + Dir[".*"] - [".", "..", ".git", "Rakefile"]
  entries.each do |e|
    cmd = "ln -sfn #{File.expand_path(e)} ~/#{e}"
    puts cmd
    system cmd
  end
end

task :default => :install
