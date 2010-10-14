IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT] = true

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
end

begin
  require 'ap'
  alias pp ap
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue LoadError
end

begin
  require 'interactive_editor'
rescue LoadError
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

alias q exit

if defined?(User) && User.respond_to?(:current=)
  user = File.exist?(".current_user_id") ? User.get(File.read(".current_user_id").strip.to_i) : User.first
  User.current = user
end
