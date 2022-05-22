local key = vim.api.nvim_set_keymap

-- Exit terminal mode (ESC / Ctrl + g)
key("t", "<Esc>", "<C-\\><C-n>", {})
key("t", "<C-g>", "<C-\\><C-n>", {})

-- following option will hide the buffer when it is closed instead of deleting
-- the buffer. This is important to reuse the last terminal buffer
-- IF the option is not set, plugin will open a new terminal every single time
vim.o.hidden = true

require("nvim-terminal").setup {
	window = {
		position = "botright",
		split = "sp",
		width = 50,
		height = 15,
	},
	disable_default_keymaps = false,
	toggle_keymap = "<C-A-t>"
}
