local key = vim.api.nvim_set_keymap
local opts = { noremap = true }

-------------
-- Keymaps --
-------------

-- Toggle Zen Mode (Ctrl + Alt + z)
key("n", "<C-A-z>", "<cmd>ZenMode<CR>", opts)

-------------------
-- Configuration --
-------------------

require("zen-mode").setup {
	window = {
		width = 112,
		height = 38,
		options = {
			number = true,
			relativenumber = true,
			cursorline = true
		}
	},

	-- This is a workaround for a bug that resets my fold fillchair when Zen Mode
	-- is enabled
	on_open = function () vim.opt.fillchars = "fold: " end
}
