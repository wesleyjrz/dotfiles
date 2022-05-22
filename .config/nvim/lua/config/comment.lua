require("Comment").setup {
	padding = true,     -- add a whitespace b/w the comment and the line
	toggler = {
		line = "<C-c>",   -- toggle line-comment
		block = "<C-A-c>" -- toggle block-comment
	},
	opleader = {
		line = "gc",      -- toggle line-comment
		block = "gb"      -- toggle block-comment
	},
	mappings = {
		-- Operator-pending mapping
		-- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
		-- NOTE: These mappings can be changed individually by `opleader` and `toggler` config
		basic = true,
		-- Extra mapping
		-- Includes `gco`, `gcO`, `gcA`
		extra = false,
		-- Extended mapping
		-- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
		extended = false
	}
}
