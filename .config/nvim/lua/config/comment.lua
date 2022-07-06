local ft = require("Comment.ft")

-------------------
-- Commentstring --
-------------------

ft.set("c", "/*%s*/")

-------------------
-- Configuration --
-------------------

require("Comment").setup {
	padding = true,   -- add a space b/w the comment and the line
	toggler = { line = "<C-c>" },
	opleader = {
		line = "gc",
		block = "gb"
	},
	extra = {
		above = "gcO",
		below = "gco",
		eol = "gcA",
	},
	mappings = {
		-- Operator-pending mapping
		-- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
		basic = true,
		-- Extra mapping
		-- Includes `gco`, `gcO`, `gcA`
		extra = true,
		-- Extended mapping
		-- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
		extended = false
	}
}
