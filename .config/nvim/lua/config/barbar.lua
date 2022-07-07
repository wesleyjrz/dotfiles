local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-------------
-- Keymaps --
-------------

-- Navigation (Ctrl + p/n)
key("n", "<C-p>", ":BufferPrevious<CR>", opts)
key("n", "<C-n>", ":BufferNext<CR>", opts)

-- Close tab (Ctrl + e)
key("n", "<C-e>", ":BufferClose<CR>", opts)

-- Magick buffer-picking (Ctrl + f)
key("n", "<C-f>", ":BufferPick<CR>", opts)

-- Move tabs (Ctrl + P/N)
key("n", "<C-S-p>", ":BufferMovePrevious<CR>", opts)
key("n", "<C-S-n>", ":BufferMoveNext<CR>", opts)

-------------------
-- Configuration --
-------------------

vim.g.bufferline = {
	animation = false,
	auto_hide = true, -- auto-hide tabs when there's a single buffer
	closable = false, -- enable close button
	clickable = true, -- enable clickable tabs (mouse support)
	-- Hide terminal buffer/tab
	exclude_name = { "zsh" }
}
