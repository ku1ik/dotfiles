---------------------------
-- Default awesome theme --
---------------------------

theme = {}

--theme.font          = "Aller Bold 9"
--theme.font          = "Droid Sans Bold 10"
theme.font          = "Droid Sans Bold 9"

theme.bg_normal     = "#3C3B37"
--theme.bg_focus      = "#0077BB"
theme.bg_focus      = "#3C3B37"
--theme.bg_focus      = "#0088CC"
theme.bg_urgent     = "#DF6900"
theme.bg_minimize   = "#111111"

theme.fg_normal     = "#aaaaaa"
--theme.fg_normal     = "#659fdb"
--theme.fg_focus      = "#659fdb"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#999999"

theme.border_width  = "1"
theme.border_normal = "#3C3B37"
--theme.border_focus  = "#0077BB"
theme.border_focus  = "#3C3B37"
--theme.border_focus  = "#659fdb"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.taglist_bg_focus = "#0088CC"

-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

theme.tasklist_floating_icon = "/home/kill/.config/awesome/themes/default/tasklist/butterfly.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = "20"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/kill/.config/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/kill/.config/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/kill/.config/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/kill/.config/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/kill/.config/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/kill/.config/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/kill/.config/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/kill/.config/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/kill/.config/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/kill/.config/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/kill/.config/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/kill/.config/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/kill/.config/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/kill/.config/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/kill/.config/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/kill/.config/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/kill/.config/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/kill/.config/awesome/themes/default/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "awsetbg -u feh /home/kill/.config/awesome/themes/wallpaper.png" }

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/kill/.config/awesome/themes/default/layouts/fairh.png"
theme.layout_fairv = "/home/kill/.config/awesome/themes/default/layouts/fairv.png"
theme.layout_floating  = "/home/kill/.config/awesome/themes/default/layouts/floating.png"
theme.layout_magnifier = "/home/kill/.config/awesome/themes/default/layouts/magnifier.png"
theme.layout_max = "/home/kill/.config/awesome/themes/default/layouts/max.png"
theme.layout_fullscreen = "/home/kill/.config/awesome/themes/default/layouts/fullscreen.png"
theme.layout_tilebottom = "/home/kill/.config/awesome/themes/default/layouts/tilebottom.png"
theme.layout_tileleft   = "/home/kill/.config/awesome/themes/default/layouts/tileleft.png"
theme.layout_tile = "/home/kill/.config/awesome/themes/default/layouts/tile.png"
theme.layout_tiletop = "/home/kill/.config/awesome/themes/default/layouts/tiletop.png"
theme.layout_spiral  = "/home/kill/.config/awesome/themes/default/layouts/spiral.png"
theme.layout_dwindle = "/home/kill/.config/awesome/themes/default/layouts/dwindle.png"

theme.awesome_icon = "/home/kill/.config/awesome/icons/awesome16.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
