local key = vim.api.nvim_set_keymap

-- Exit terminal mode (ESC / Ctrl + g)
key("t", "<Esc>", "<C-\\><C-n>", {})
key("t", "<C-g>", "<C-\\><C-n>", {})

-- The following option will hide the buffer when it is closed instead of
-- deleting it
vim.o.hidden = true

require("nvim-terminal").setup {
	toggle_keymap = "<C-A-t>",
	window = {
		position = "botright",
		split = "sp",
		width = 50,
		height = 10
	}
}
