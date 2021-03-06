require("nvim-treesitter.configs").setup {
	ensure_installed = ProgLangsTS,
	highlight = {
		enable = true, -- "false" will disable the whole extension
		additional_vim_regex_highlighting = false
	},
	indent = { enable = true },

	-- External modules
	autotag = { enable = true },
	rainbow = {
		enable = false,
		extended_mode = true
	}
}
