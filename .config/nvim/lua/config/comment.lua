local ft = require("Comment.ft")

-------------------
-- Commentstring --
-------------------

ft.set("c", "/*%s*/")

-------------------
-- Configuration --
-------------------

require("Comment").setup {
	padding = true,     -- add a space b/w the comment and the line
	toggler = {
		line = "<C-c>",   -- toggle line-comment
	},
	opleader = {
		line = "gc",      -- toggle line-comment
		block = "gb"      -- toggle block-comment
	},
	extra = {
		above = "gcO",    -- add comment on the line above
		below = "gco",    -- add comment on the line below
		eol = "gcA",      -- add comment at the end of line
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
