#!/usr/bin/lua
local handle = io.popen("jq .colors.color1 colors.json")
local color1 = handle:read("*l")
handle:close()
handle = io.popen("jq .colors.color2 colors.json")
local color2 = handle:read("*l")
handle:close()

print(color1)
print(color2)
