client.add_signal("manage", function (c, startup)
    if (awful.client.floating.get(c)) or (awful.layout.get(c.screen) ==  awful.layout.suit.floating) then
      awful.titlebar.add(c, { modkey = modkey })
    end

    c:add_signal("property::floating", function(c)
      if awful.client.floating.get(c) then
        awful.titlebar.add(c, { modkey = modkey })
      else
        awful.titlebar.remove(c)
      end
    end)
end)
