local f = io.popen("uname -snr")
local uname = f:read("*line")
f:close()
hostname = string.match(uname, "[%w]+[%s]([%w%p]+)[%s][%w%p]+")
