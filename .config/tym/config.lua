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

tym.set_config {
	-- Font
	font = "JetBrains Mono Nerd Font 11",

	-- Cursor
	cursor_shape = "block",
	cursor_blink_mode = "on",

	-- Misc
	scrollback_length = 10240,
	silent = true,
	autohide = false, -- auto-hide mouse when type
}

-------------
-- Keymaps --
-------------

tym.set_keymaps {
	-- Increase / Decrease font size
	["<Ctrl><Shift>k"] = function ()
		local current_size = tym.get("scale")
		tym.set("scale", current_size + 10)
		tym.apply()
	end,
	["<Ctrl><Shift>j"] = function ()
		local current_size = tym.get("scale")
		tym.set("scale", current_size - 10)
		tym.apply()
	end,
	["<Ctrl><Shift>l"] = function ()
		local default_size = 100
		tym.set("scale", default_size)
		tym.apply()
	end
}
