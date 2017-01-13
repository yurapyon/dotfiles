local gears = require "gears"
local awful = require "awful"
awful.rules = require "awful.rules"
local wibox = require "wibox"
local beautiful = require "beautiful"
local naughty = require "naughty"

local string = require "string"
local fmt = string.format

local function notify(title, msg)
    naughty.notify {
        preset = naughty.config.presets.normal
        , title = title or "notify"
        , text = msg or ""
    }
end

local function notifytf(bool)
    if bool then
        notify("true", "true")
    else
        notify("false", "false")
    end
end

beautiful.init("~/.config/awesome/themes/zenburn/theme.lua")
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

local modkey = "Mod4"
local term = "urxvt"
local programs = {
    "ncmpcpp"
    , dmenu = "dmenu_run -f -p '<3' -fn termsyn:bold -h 18 "
        .."-nb '#eeeeee' -nf '#555555' -sb '#282828' -sf '#40bb7a'"
    , maim_all = "maim /home/mel/images/screenshots/pic$(date +%02l%02M%02S).png"
    , maim_part = "maim -s -c 0,0.8,0.6,1 ~/images/screenshots/pic$(date +%02l%02M%02S).png"
    , umpv = "~/documents/scripts/umpv.py $(xclip -o)"
}

for i=1, #programs do
    programs[programs[i]] = term.." -e "..programs[i]
    programs[i] = nil
end

for k,v in pairs(programs) do
    programs[k] = function ()
        awful.util.spawn_with_shell(v)
    end
end

local layouts = {
    awful.layout.suit.tile,
    --awful.layout.suit.fair,
    --awful.layout.suit.floating,
}

local tag_strs = { "♡", "n", "x", "blood", "KILL", "01anncvx" }

tags = {}
for s = 1, screen.count() do
    tags[s] = awful.tag(tag_strs, s, layouts[1])
end

local alert = false
local function get_time()
    f = assert(io.popen("date +'%l %M %S %p'"))
    local _, _, h, m, s, p = string.find(f:read("*l"), "(%d+)%s(%d+)%s(%d+)%s(%a+)")
    f:close()
    h = tonumber(h)
    m = tonumber(m)
    s = tonumber(s)
    if p == "AM" and h >= 1 and h <= 6 and s % 6 == 0 then
        alert = true
	naughty.notify{
	    preset = naughty.config.presets.normal
	    , timeout = math.random(9)
	    , bg = "#ff5500"
	    , text = "just sleep mouth*r f*kr"
	}
    elseif s % 3 == 0 then
        alert = false
    end 
    if alert then
        return "RGO TO BEd\\(x"
    else
	return fmt("%02d.%02d.%02d\\(%s", h, m, s - ( s % 3 ), p)
    end
end

local last_time = ""
local clock = wibox.widget.textbox()
clock:set_text(get_time())
clock_timer = timer( {timeout = 1} )
clock_timer:connect_signal("timeout", function ()
    clock:set_text(get_time())
end)
clock_timer:start()

local function get_power_str()
    local out = ""

    local f = assert(io.popen("cat /sys/class/power_supply/BAT0/status", "r"))    
    local status = string.sub(f:read("*l"), 1, 1)
    f:close()    

    f = assert(io.popen("cat /sys/class/power_supply/BAT0/capacity", "r"))    
    local amt = f:read("*l")
    f:close()    

    if status == 'D' then
        out = out.." b"
    elseif status == 'C' then 
        out = out.." c"
    elseif status == 'F' then 
        out = out.." f"
    end

    if string.len(amt) == 1 then
        out = out.."  "..amt
    elseif string.len(amt) == 2 then
        out = out.." "..amt
    else
        out = out..amt
    end
    
    return out.." "
end

local batt = wibox.widget.textbox()
batt:set_text(get_power_str())
batt_timer = timer( {timeout = 9} )
batt_timer:connect_signal("timeout", function ()
    batt:set_text(get_power_str())
end)
batt_timer:start()

local indc = wibox.widget.textbox()
indc:set_text("")
indc:set_align("left")

local lwibox = {}
local prompt = {}
local layoutbox = {}
local taglist = {}
for s = 1, screen.count() do
    prompt[s] = awful.widget.prompt()
    layoutbox[s] = awful.widget.layoutbox(s)
    taglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all)
    lwibox[s] = awful.wibox({ position = "top", screen = s })

    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(taglist[s])
    left_layout:add(prompt[s])
    left_layout:add(indc)

    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(clock)
    right_layout:add(batt)
    right_layout:add(layoutbox[s])

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    --layout:set_middle()
    layout:set_right(right_layout)

    lwibox[s]:set_widget(layout)
end


-- awful.key returns a table
-- you join all these tables into something bigger that is
--  searched through on every key press
--    or
--  translated to c equivalents on root.setkeys()
-- each key binding executes arbitrary lua functions when pressed
--  easily enough this gives you all the functionality you could need
--  as lua can call back into c by eposing c funcs to lua

-- keys

local function k(key, press, release)
    return awful.key({}, key, press, release)
end

local function mod(key, press, release)
    return awful.key({modkey}, key, press, release)
end

local function mod_shift(key, press, release)
    return awful.key({modkey, "Shift"}, key, press, release)
end

local function mod_alt(key, press, release)
    return awful.key({modkey, "Mod1"}, key, press, release)
end

local function eval_lua(str)
    str = string.gsub(str, "=(.+)", "return %1")
    local out = awful.util.eval(str)
    local text = out
    -- does not return actual table, just returns text
    --[[
    local text = ""
    if type(out) == "table" then
            text = text..i.." "..table[i].."\n"
        for i=1, #table do
        end
        for k,v in pairs(table) do
            text = text..k.." "..v.."\n"
        end
    end
    --]]
    notify("lua eval: "..str, text)
end

globalkeys = awful.util.table.join(
    -- windoes
    mod("Right",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end)
    , mod("Left",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end)
    , mod_alt("Right", function () awful.client.swap.byidx( 1) end)
    , mod_alt("Left", function () awful.client.swap.byidx(-1) end)

    , mod("Down",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end)
    , mod("Up",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end)
    , mod_alt("Down", function () awful.client.swap.byidx( 1) end)
    , mod_alt("Up", function () awful.client.swap.byidx(-1) end)

    , mod("Return", function () awful.util.spawn(term) end)
    , mod_shift("r", awesome.restart)
    --, mod("space", function () awful.layout.inc(layouts, 1) end)
    --, mod_shift("space", function () awful.layout.inc(layouts, -1) end)
    , mod("l", function () awful.tag.incmwfact( 0.05) end)
    , mod("h", function () awful.tag.incmwfact(-0.05) end)

    , mod("F6", function () awful.util.spawn("redshift -O 1200") end)
    , mod("F7", function () awful.util.spawn("redshift -O 2400") end)
    , mod("F5", function () awful.util.spawn("redshift -x ") end)

    , mod("y", programs.umpv)

    , k("Print", programs.maim_all)
    , mod("Print", programs.maim_part)
    , mod("d", programs.dmenu)
    , mod_shift("n", programs.ncmpcpp)

    , mod("u", function ()
        awful.prompt.run( {prompt = " | eval lua: "},
        prompt[mouse.screen].widget,
        eval_lua, nil,
        awful.util.getdir("cache") .. "/history_eval")
    end)

    , mod_shift("e", function ()
        local keys = globalkeys
        indc:set_text(" | esc go back  e exit  r reboot  s shutdown")
        root.keys(awful.util.table.join(
            k("Escape", function ()
                root.keys(keys)
                indc:set_text("")
            end)
            , k("Return", function ()
                root.keys(keys)
                indc:set_text("")
            end)
            , k("e", function () awesome.quit() end)
            , k("r", function () awful.util.spawn("reboot") end)
            , k("s", function () awful.util.spawn("shutdown now") end)
        ))
    end)
)

local saved_clients = {}
local last_tag = tags[1][1]

--[[
local function save_client(tag)
    saved_clients[tag.name] = client.focus 
end

local function restore_client(tag)
    local cls = tag:clients()
    client.focus = saved_clients[tag.name] or cls[#cls]
end
--]]

local function view_tag(key, tag_num)
    return mod(key, function ()
        saved_clients[last_tag.name] = client.focus
        local tag = awful.tag.gettags(mouse.screen)[tag_num]
        awful.tag.viewonly(tag)
        last_tag = tag
        local cls = tag:clients()
        client.focus = saved_clients[tag.name] or cls[#cls]
    end)
end

local function move_to_tag(key, tag_num)
    return mod_alt(key, function ()
        local tag = awful.tag.gettags(mouse.screen)[tag_num]
	saved_clients[tag.name] = client.focus
	awful.client.movetotag(tag)
	local cls = last_tag:clients()
	client.focus = cls[#cls] 
    end)
end

local globalkeys = awful.util.table.join(globalkeys
    , view_tag("1", 1)
    , view_tag("2", 2)
    , view_tag("3", 3)
    , view_tag("q", 4)
    , view_tag("w", 5)
    , view_tag("e", 6)
    , move_to_tag("1", 1)
    , move_to_tag("2", 2)
    , move_to_tag("3", 3)
    , move_to_tag("q", 4)
    , move_to_tag("w", 5)
    , move_to_tag("e", 6)
)

root.keys(globalkeys)
    
--TODO save clients on switches
local clientkeys = awful.util.table.join(
    mod_shift("q", function (c)
        --saved_clients[last_tag.name] = client.focus
        c:kill()
        --awful.client.focus.byidx(-1)
    end)
    , mod("t", function (c)
        c:lower()
    end)
)

local clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c)
        client.focus = c
        c:raise()
    end)
    , awful.button({ modkey }, 1, function (c)
        awful.mouse.client.move(c)
        client.focus = c
        c:raise()
	end)
    , awful.button({ modkey }, 3, function (c)
        awful.mouse.client.resize(c)
        client.focus = c
        c:raise()
    end)
)

awful.rules.rules = {
    { rule = { }
        , properties = {
            border_width = beautiful.border_width
            , border_color = beautiful.border_normal
            , focus = awful.client.focus.filter
            , raise = true
            , keys = clientkeys
            , buttons = clientbuttons } }
    , { rule_any = { class = {"mpv", "gimp", "Gimp", "transmission"}, name = { "ncmpcpp" } }
        , properties = { floating = true } 
	, callback = function (c) awful.placement.centered(c) end } 
    , { rule_any = { instance = {"urxvt"} }
        , properties = { size_hints_honor = false } }
    , { rule = { class = "Firefox" }
        , properties = { tag = tags[1][2] } }
    , { rule = { class = "transmission" }
        , properties = { tag = tags[1][4] } }
    , { rule = { name = "bar" }
        , properties = { border_width = 0 } }
    , { rule = { class = "mpv" }
        , properties = { buttons = awful.util.table.join(clientbuttons, awful.button({ }, 1, awful.mouse.client.move)) } }
}

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
client.connect_signal("unmanage", function (c, startup)
    local cls = last_tag:clients()
    client.focus = cls[#cls]
end)
client.connect_signal("manage", function (c, startup)
    --client.focus.history.add (c)

    if not startup then
        awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)
