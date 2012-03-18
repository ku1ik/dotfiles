require 'fileutils'

def symlink_(src, dst=nil)
  dst = src if dst.nil?
  dst_dir = File.expand_path("~/#{File.dirname(dst)}")
  FileUtils.mkdir_p(dst_dir) unless File.directory?(dst_dir)
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
end

task :default => :symlink_dotfiles
