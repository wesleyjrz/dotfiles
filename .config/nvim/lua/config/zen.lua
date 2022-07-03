local key = vim.api.nvim_set_keymap

-----------------
-- Keymappings --
-----------------

-- Enable / Disable Zen Mode (Ctrl + Alt + Z)
key("n", "<C-A-z>", "<cmd>ZenMode<CR>", {})

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
