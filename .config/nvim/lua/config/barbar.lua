local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

---------------------------
-- Tab mappings (Ctrl-t) --
---------------------------

-- Navigate
key("n", "<C-t>h", ":BufferPrevious<CR>", opts)
key("n", "<C-t>l", ":BufferNext<CR>", opts)
key("n", "<C-t>g", ":BufferPick<CR>", opts) -- magic buffer-picking mode

-- Manage tabs
key("n", "<C-t>b", ":BufferMovePrevious<CR>", opts)
key("n", "<C-t>w", ":BufferMoveNext<CR>", opts)
key("n", "<C-t>x", ":BufferClose<CR>", opts) -- close buffer

-------------------
-- Configuration --
-------------------

vim.g.bufferline = {
  animation = false,
  auto_hide = true, -- auto-hide tabs when there's a single buffer
  closable = false, -- enable close button
  clickable = true  -- enable clickable tabs (mouse support)
}
