local key = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local opts = { noremap = true }

-------------
-- Keymaps --
-------------

-- Toggle terminal (Ctrl + Alt + s)
key("t", "<C-A-s>", "<C-\\><C-n><C-A-s>", opts)

-- Navigate from/to the terminal window (Ctrl + h/j/k/l)
key("t", "<C-w>h", "<C-\\><C-n><C-w>h", opts)
key("t", "<C-w>j", "<C-\\><C-n><C-w>j", opts)
key("t", "<C-w>k", "<C-\\><C-n><C-w>k", opts)
key("t", "<C-w>l", "<C-\\><C-n><C-w>l", opts)

-- Terminal window options
autocmd("TermOpen", {
	command = [[ startinsert! |
	             setlocal nonumber |
	             setlocal norelativenumber |
	             setlocal nocursorline ]]
})

-- Just hide the terminal buffer
vim.o.hidden = true

require("nvim-terminal").setup {
	toggle_keymap = "<C-A-s>",
	window = {
		position = "botright",
		split = "sp",
		width = 50,
		height = 10
	}
}
