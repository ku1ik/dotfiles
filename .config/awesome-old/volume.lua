volumecfg = {}
volumecfg.cardid  = 0
volumecfg.channel = "Master"

volumecfg.mixercommand = function(command)
  local fd = io.popen("amixer -c " .. volumecfg.cardid .. command)
  local status = fd:read("*all")
  fd:close()
  local volume = string.match(status, "(%d?%d?%d)%%")
  --volume = string.format("% 3d", volume)
  status = string.match(status, "%[(o[^%]]*)%]")
  if string.find(status, "on", 1, true) then
    volumecfg.widget:set_value(volume / 100.0)
  else
    volumecfg.widget:set_value(0)
  end
end

volumecfg.update = function()
  volumecfg.mixercommand(" sget " .. volumecfg.channel)
end

volumecfg.up = function()
  volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 5%+ on")
end

volumecfg.down = function()
  volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 5%- on")
end

volumecfg.toggle = function()
  volumecfg.mixercommand(" sset " .. volumecfg.channel .. " toggle")
end

function volume_init(volwidget)
  volumecfg.widget = volwidget

  volwidget.widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () exec("urxvt -e alsamixer") end),
    awful.button({ }, 2, function () volumecfg.toggle() end),
    awful.button({ }, 4, function () volumecfg.up() end),
    awful.button({ }, 5, function () volumecfg.down() end)
  ))

  ----vicious.register(volwidget, vicious.widgets.volume, "$1", 2, "PCM")
  awful.hooks.timer.register(30, function () volumecfg.update() end)
  volumecfg.update()
end
