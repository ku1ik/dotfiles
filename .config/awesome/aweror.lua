-- aweror.lua
-- Save this file as "aweror.lua" in awesome's system library directory "/usr/local/share/awesome/lib",
-- "/usr/share/awesome/lib", or your own config directory "~/.config/awesome/".
-- You will also need a "ror.lua" file (contains your key bindings) in your config directory.
-- Now you need to generate and add the keybindings in your ~/.config/awesome/rc.lua
-- In the rc.lua file there will be a "root.keys(globalkeys)" command that sets
-- your keys, you need to add the following lines just before that command:
--
-- require("aweror")
-- globalkeys = awful.util.table.join(globalkeys, aweror.genkeys(modkey))


-- get our key bindings from separate ror.lua file
require("ror")

local awful=awful
local client=client
local pairs=pairs
local table=table
local allt1=ror.table5
local print=print
local USE_T = true
--local USE_T = false
module("aweror")

function run_or_raise(cmd, properties)
   local clients = client.get()
   local focused = awful.client.next(0)
   local findex = 0
   local matched_clients = {}
   local n = 0
   for i, c in pairs(clients) do
      --make an array of matched clients
      if match(properties, c) then
         n = n + 1
         matched_clients[n] = c
         if c == focused then
            findex = n
         end
      end
   end
   if n > 0 then
      local c = matched_clients[1]
      -- if the focused window matched switch focus to next in list
      if 0 < findex and findex < n then
         c = matched_clients[findex+1]
      end
      local ctags = c:tags()
      if table.getn(ctags) == 0 then
         -- ctags is empty, show client on current tag
         local curtag = awful.tag.selected()
         awful.client.movetotag(curtag, c)
      else
         -- Otherwise, pop to first tag client is visible on
         awful.tag.viewonly(ctags[1])
      end
      -- And then focus the client
      client.focus = c
      c:raise()
      return
   end
   awful.util.spawn(cmd)
end

-- Returns true if all pairs in table1 are present in table2
function match (table1, table2)
   for k, v in pairs(table1) do
      if table2[k] ~= v and not table2[k]:find(v) then
         return false
      end
   end
   return true
end

function genfun(t3)
   local cmd=t3[1]
   local rule=t3[2]
   local flag=t3[3]
   local table1={}
   s1="class"
   if flag then
     s1=flag
   end
   table1[s1]=rule
   return function()
     run_or_raise(cmd,table1)
   end
end

function genkeys(mod1)
   rorkeys = awful.util.table.join()
  for i,v in pairs(allt1) do
   rorkeys = awful.util.table.join(rorkeys,
    awful.key({ mod1,}, i, genfun(v))
    )
  end
  return rorkeys
end
