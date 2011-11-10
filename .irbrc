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

alias q exit

if defined?(User)
  if User.respond_to?(:current=)
    user = File.exist?(".current_user_id") ? User.get(File.read(".current_user_id").strip.to_i) : User.first
    User.current = user
  end

  User.class_eval do
    def self.me
      find_by_email("marcin.kulik@llp.pl") || find_by_email("marcin.kulik@gmail.com")
    end
  end
end

# http://ozmm.org/posts/time_in_irb.html
def time(times = 1)
  require 'benchmark'
  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

# http://github.com/rtomayko/dotfiles/blob/rtomayko/.irbrc
# list object methods
def local_methods(obj=self)
  (obj.methods - obj.class.superclass.instance_methods).sort
end

def ls(obj=self)
  width = `stty size 2>/dev/null`.split(/\s+/, 2).last.to_i
  width = 80 if width == 0
  local_methods(obj).each_slice(3) do |meths|
    pattern = "%-#{width / 3}s" * meths.length
    puts pattern % meths
  end
end

# Just for Rails3
if defined?(ActiveSupport::Notifications)
  $odd_or_even_queries = false
  ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
    $odd_or_even_queries = !$odd_or_even_queries
    color = $odd_or_even_queries ? "\e[36m" : "\e[35m"
    event = ActiveSupport::Notifications::Event.new(*args)
    time = "%.1fms" % event.duration
    name = event.payload[:name]
    sql = event.payload[:sql].gsub("\n", " ").squeeze(" ")
    puts " \e[1m#{color}#{name} (#{time})\e[0m #{sql}"
  end
end
