local key = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd

-- Toggle terminal even in terminal mode (Ctrl + Alt + t)
key("t", "<C-A-t>", "<C-\\><C-n><C-A-t>", {})

-- Navigate from the terminal window (Ctrl + h/j/k/l)
key("t", "<C-h>", "<C-\\><C-n><C-w>h", {})
key("t", "<C-j>", "<C-\\><C-n><C-w>j", {})
key("t", "<C-k>", "<C-\\><C-n><C-w>k", {})
key("t", "<C-l>", "<C-\\><C-n><C-w>l", {})

-- Terminal window options
autocmd("TermOpen", {
	command = [[ startinsert! |
	             setlocal nonumber |
	             setlocal norelativenumber |
	             setlocal nocursorline ]]
})

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
