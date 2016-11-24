#!/bin/luajit

if    arg[1] ~= "on"
  and arg[1] ~= "off" then
  do return end
end

local string = require "string"
local fmt = string.format

local f = io.popen("xinput list --id-only 'Wacom Bamboo 2FG 6x8 Finger'", "r")
local str = f:read("*a")
f:close()

local device_num = tonumber(str)

if not device_num then do return end end

io.write("turning ", arg[1], "\n")
os.execute(fmt("xinput set-prop %d \"Device Enabled\" %d", device_num, arg[1] == "on" and 1 or 0))
