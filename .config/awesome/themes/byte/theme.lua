-- AwesomeWM theme (~/.config/awesome/themes/byte/theme.lua)
-- mu @ freenode

theme = {}
theme.confdir = awful.util.getdir("config") .. "/themes/byte"

--theme.font          = "-artwiz-cure-*-r-normal-*-*-*-*-*-*-*-iso8859-1"
theme.font          = "cure 10"

theme.bg_normal     = "#262729"
theme.bg_focus      = "#262729"
theme.bg_urgent     = "#262729"
theme.bg_minimize   = "#262729"

theme.fg_normal     = "#fafafa"
theme.fg_focus      = "#659fdb"
theme.fg_urgent     = "#f03669"
theme.fg_minimize   = "#fafafa"

theme.border_width  = "0"
theme.border_normal = "#fafafa"
theme.border_focus  = "#659fdb"
theme.border_marked = "#91231c"

theme.wallpaper_cmd = { "awsetbg /home/byte/images/bg/bg1_blue1px.png" }

-- Display the taglist squares
theme.taglist_squares_sel   = theme.confdir .. "/taglist/focus.png"
theme.taglist_squares_unsel = theme.confdir .. "/taglist/unfocus.png"

-- Layout icons
theme.layout_fairh = theme.confdir .. "/layouts/fairh.png"
theme.layout_fairv = theme.confdir .. "/layouts/fairv.png"
theme.layout_floating  = theme.confdir .. "/layouts/floating.png"
--theme.layout_magnifier = theme.confdir .. "/layouts/magnifier.png"
--theme.layout_max = theme.confdir .. "/layouts/max.png"
--theme.layout_fullscreen = theme.confdir .. "/layouts/fullscreen.png"
theme.layout_tilebottom = theme.confdir .. "/layouts/tilebottom.png"
theme.layout_tileleft   = theme.confdir .. "/layouts/tileleft.png"
theme.layout_tile = theme.confdir .. "/layouts/tile.png"
theme.layout_tiletop = theme.confdir .. "/layouts/tiletop.png"
--theme.layout_spiral  = theme.confdir .. "/layouts/spiral.png"
--theme.layout_dwindle = theme.confdir .. "/layouts/dwindle.png"

-- Widget icons
theme.widget_sep = theme.confdir .. "/widgets/seperator.png"
theme.widget_cpu = theme.confdir .. "/widgets/cpu.png"
theme.widget_temp = theme.confdir .. "/widgets/temp.png"
theme.widget_mem = theme.confdir .. "/widgets/mem.png"
theme.widget_spkr = theme.confdir .. "/widgets/spkr.png"
theme.widget_head = theme.confdir .. "/widgets/phones.png"
theme.widget_netdown = theme.confdir .. "/widgets/net_down.png"
theme.widget_netup = theme.confdir .. "/widgets/net_up.png"
theme.widget_mail = theme.confdir .. "/widgets/mail.png"
theme.widget_newmail = theme.confdir .. "/widgets/newmail.png"
theme.widget_pacman = theme.confdir .. "/widgets/pacman.png"
theme.widget_newpackage = theme.confdir .. "/widgets/newpackage.png"
theme.widget_batt_full = theme.confdir .. "/widgets/bat_full.png"
theme.widget_batt_low = theme.confdir .. "/widgets/bat_low.png"
theme.widget_batt_empty = theme.confdir .. "/widgets/bat_empty.png"
theme.widget_clock = theme.confdir .. "/widgets/clock.png"
theme.widget_mpd = theme.confdir .. "/widgets/note.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
