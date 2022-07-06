--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

local key = vim.api.nvim_set_keymap
local norm = { noremap = true }
local silent = { noremap = true, silent = true }

----------------------
-- Editor-like keys --
----------------------

-- These keybindings doesn't follow Vim defaults where we have meanings for
-- every key, but it's like general text editors and some IDEs out there, just
-- to avoid mistakes made by muscle memory.

-- Save file (Ctrl + s)
key("n", "<C-s>", "<cmd>w!<CR>", norm)
key("i", "<C-s>", "<Esc><cmd>w!<CR>", norm)

-- Quit vim / close window (Ctrl + x)
key("n", "<C-x>", "<cmd>q!<CR>", norm)

-- Emacs-like cancel key (Ctrl + g)
key("i", "<C-g>", "<Esc>", norm)

-- Classic undo key (Ctrl + z)
key("n", "<C-z>", "u", norm)

---------------------
-- Convenient keys --
---------------------

-- Keys that make more sense to work with.

-- Fold / Unfold (Tab)
key("n", "<TAB>", "za", norm)

-- Unfold all (Alt + Tab)
key("n", "<A-TAB>", "zR", norm)

-- Easier window navigation (Ctrl + h/j/k/l)
key("n", "<C-h>", "<C-w>h", silent)
key("n", "<C-j>", "<C-w>j", silent)
key("n", "<C-k>", "<C-w>k", silent)
key("n", "<C-l>", "<C-w>l", silent)

-- Hide searching highlights (Esc / Ctrl + g)
key("n", "<Esc>", "<cmd>nohl<CR>", silent)
key("n", "<C-g>", "<cmd>nohl<CR>", silent)
