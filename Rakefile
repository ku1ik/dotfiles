def symlink_(src, dst=nil)
  dst = src if dst.nil?
  cmd = "ln -sfn #{File.expand_path(src)} ~/#{dst}"
  puts cmd
  system cmd
end

desc "Symlink"
task :symlink_dotfiles do
  DONT_SYMLINK = %w(
    .
    ..
    .git
    .gitignore
    .gitignore_global
    .gitmodules
    .config
    .xmonad
    .ncmpcpp
    .rvm
    Rakefile
    README.md
    firefox
  ) + Dir['.config/*']

  entries = Dir['*'] + Dir['.*'] - DONT_SYMLINK
  entries.each { |e| symlink_(e) }

  symlink_('.xmonad/xmonad.hs')
  symlink_('.ncmpcpp/config')
  symlink_('.config/autostart/edit-server.desktop')
  symlink_('.config/autostart/mpd.desktop')
  symlink_('.gitignore_global', '.gitignore')
end

task :default => :symlink_dotfiles
