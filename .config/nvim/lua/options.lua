local o = vim.opt
local wo = vim.wo
local fn = vim.fn

------------
-- Visual --
------------

o.showmode = false       -- show current mode
o.title = true           -- show current file name as window title
o.showtabline = 0        -- when to show nvim tabline
o.termguicolors = true   -- enables 24-bit RGB color
o.cmdheight = 1          -- command line height
o.pumheight = 10         -- max number of items to show in the popup menu
wo.number = true         -- show line numbers
wo.relativenumber = true -- show relative line numbers
o.cursorline = false     -- highlight current line
o.scrolloff = 8          -- scroll vertically easier
o.sidescrolloff = 8      -- scroll horizontally easier

---------
-- GUI --
---------

o.guifont = "JetBrains Mono:h11", "Ubuntu Mono:h11", "Fira Code:h11"
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode

---------------
-- Behaviour --
---------------

o.ignorecase = true         -- ignore case in search patterns
o.smarttab = false          -- when on, a <Tab> in front of a line inserts blanks
o.smartindent = true        -- do smart autoindenting when starting a new line
o.autoindent = true         -- copy indent from current line when starting a new line
o.expandtab = true          -- insert spaces when TAB is pressed
o.shiftwidth = 2            -- number of spaces to use for each step of (auto)indent
o.tabstop = 2               -- number of spaces that a <Tab> in the file counts for
o.mouse = "nv"              -- enable mouse support on selected modes
o.splitbelow = true         -- force all horizontal splits to open below current window
o.splitright = true         -- force all vertical splits to open in the right of current window
o.hidden = true             -- do not ask to save when switching buffers
o.fileencoding = "utf-8"    -- default file encoding
o.clipboard = "unnamedplus" -- allow nvim to access system clipboard (depends on xclip)
o.updatecount = 100         -- after typing this many characters the swap file will be written
o.updatetime = 300          -- if this many milliseconds nothing is typed, the swap file will be written
o.swapfile = true           -- store the things you change in a swap file
o.backup = false            -- make backups of the original file after edit it
o.writebackup = false       -- make a backup before overwriting a file
o.undofile = true           -- save undo history to an undo file
o.foldlevelstart = 99       -- start without any folding
wo.foldmethod = "expr"      -- folding method
wo.foldexpr = "nvim_treesitter#foldexpr()"
