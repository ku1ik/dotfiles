-- Handle client's borders
-- This handles beautiful's border_focus and border_normal and it removes
-- borders on fullscreen clients.

local pairs = pairs
local beautiful = require("beautiful")
local awful = {
	client = require("awful.client"),
	layout = require("awful.layout"),
	tag = require("awful.tag")
}
local capi = {
	client = client
}

module("borders")

-- {{{1 Border width

function update_borders(c)
	-- Set suitable borders on windows:
	--  If there is only a single visible, full screen window, it doesn't
	--  get a border, everything else gets one.
	local screen = c.screen
	local theme = beautiful.get()
	local clients = awful.client.visible(screen)
	local tiledclients = awful.client.tiled(screen)
	local count = #tiledclients
	local layout = awful.layout.getname(awful.layout.get(screen))
	local border

	-- clients is tiledclients without all the floating clients, i.e. those
	-- clients are the clients managed by the current layout

	-- First: Floating clients always get a border
	for unused, current in pairs(clients) do
		if awful.client.floating.get(current) then
			current.border_width = theme.border_width
		end
	end

	if (count == 1 and layout ~= "floating") or layout == "max" or layout == "fullscreen" then
		-- We aren't on a "floating" layout and the clients will be
		-- displayed fullscreen (either there is only one or this is a
		-- "max" layout which always does that).
		border = 0
	else
		-- Multiple visible, everyone gets a border
		border = theme.border_width
	end

	-- Second: All tiledclients get "border" as border
	for unused, current in pairs(tiledclients) do
		current.border_width = border
	end
end

-- New tag selected, number of visible clients could change
awful.tag.attached_add_signal(nil, "property::selected", update_borders)

-- New layout selected, could be "max" layout
awful.tag.attached_add_signal(nil, "property::layout", update_borders)

capi.client.add_signal("new", function(c)
	-- Client tagged / untagged, number of visible clients could change
	c:add_signal("tagged", update_borders)
	c:add_signal("untagged", update_borders)

	-- Floating windows get a special border, so have to update
	c:add_signal("property::floating", update_borders)
end)

-- vim: foldmethod=marker
