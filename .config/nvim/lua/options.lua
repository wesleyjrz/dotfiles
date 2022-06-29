--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

-- Here goes all my default options

local o = vim.opt
local wo = vim.wo
local fn = vim.fn

------------
-- Visual --
------------

o.showmode = false       -- show current mode
o.showtabline = 0        -- when to show nvim tabline
o.termguicolors = true   -- enables 24-bit RGB color
o.cmdheight = 1          -- command line height
o.pumheight = 10         -- max number of items to show in the popup menu
wo.number = true         -- show line numbers
wo.numberwidth = 2       -- number of columns to use for line number
wo.relativenumber = true -- show relative line numbers
o.cursorline = true      -- highlight current line
o.scrolloff = 8          -- scroll vertically easier
o.sidescrolloff = 8      -- scroll horizontally easier

---------
-- GUI --
---------

o.guifont = "JetBrains Mono:h11"
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode

---------------
-- Behaviour --
---------------

-- Folding options
local foldText = "getline(v:foldstart).' '"
local foldExpr = "nvim_treesitter#foldexpr()"

o.ignorecase = true         -- ignore case in search patterns
o.smarttab = false          -- when on, a <Tab> in front of a line inserts blanks
o.smartindent = true        -- do smart autoindenting when starting a new line
o.autoindent = true         -- copy indent from current line when starting a new line
o.shiftwidth = 2            -- number of spaces to use for each step of (auto)indent
o.tabstop = 2               -- number of spaces that a <Tab> in the file counts for
o.wrap = true               -- wrap lines (insert a visual line break)
o.linebreak = true          -- don't break incomplete words
o.formatoptions = "r2jp"    -- default autoformatting options (see fo-table help for more info)
o.textwidth = 80            -- default text width for autoformatting
o.mouse = "nv"              -- enable mouse support on selected modes
o.splitbelow = true         -- force all horizontal splits to open below current window
o.splitright = true         -- force all vertical splits to open in the right of current window
o.hidden = true             -- do not ask to save when switching buffers
o.fileencoding = "utf-8"    -- default file encoding
o.clipboard = "unnamedplus" -- allow nvim to access system clipboard (depends on xclip)
o.updatecount = 20          -- after typing this many characters the swap file will be written
o.updatetime = 300          -- if this many milliseconds nothing is typed, the swap file will be written
o.swapfile = true           -- store the things you change in a swap file
o.backup = false            -- make backups of the original file after edit it
o.writebackup = false       -- make a backup before overwriting a file
o.undofile = true           -- save undo history to an undo file
o.foldlevelstart = 99       -- start without any folding
wo.foldmethod = "expr"      -- folding method
o.fillchars = "fold: "      -- set folding fill chars to blanks
o.foldtext = foldText       -- prettier folding text
wo.foldexpr = foldExpr      -- expression used for foldexpr
