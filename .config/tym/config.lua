--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

-- Run `man tym` for more details

local tym = require("tym")

-------------
-- General --
-------------

tym.set("font", "JetBrains Mono Nerd Font 11")
tym.set_config {
	-- Cursor
	cursor_shape = "block",
	cursor_blink_mode = "on",

	-- Misc
	scrollback_length = 10240,
	silent = true,
	autohide = false, -- auto-hide mouse when type
}
