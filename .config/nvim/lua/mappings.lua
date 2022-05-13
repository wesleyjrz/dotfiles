local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Save file with (Ctrl + s)
key("n", "<C-s>", "<cmd>w!<CR>", {})
key("i", "<C-s>", "<Esc><cmd>w!<CR>", {})

-- Quit vim / close window with (Ctrl + x)
key("n", "<C-x>", "<cmd>q!<CR>", {})

-- Emacs-like quit insert mode (Ctrl + g)
key("i", "<C-g>", "<Esc>", {})

-- Classic undo keybinding (Ctrl + z)
-- (Just because of muscle memory)
key("n", "<C-z>", "u", {})

-- Open/close folds (TAB)
key("n", "<TAB>", "za", opts)

-- Open all folds (Alt + TAB)
key("n", "<A-TAB>", "zR", opts)

-- Easier window navigation (Ctrl + h/j/k/l)
key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)

-- Hide search highlights (Esc / Ctrl + g)
key("n", "<ESC>", "<C-l><cmd>nohl<CR><C-l>", opts)
key("n", "<C-g>", "<C-l><cmd>nohl<CR><C-l>", opts)

-- Run make
key("n", "<C-A-m>", "<cmd>make<CR>", opts)

-- Enable spell checking (Ctrl + Alt + s)
key("n", "<C-A-s>", "<cmd>set spell<CR>", {})
