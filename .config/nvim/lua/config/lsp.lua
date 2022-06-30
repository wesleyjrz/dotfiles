local lspconfig = require("lspconfig")
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-----------------
-- Keymappings --
-----------------

-- Open diagnostic float window (Space + Space)
key("n", "<space><space>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Navigate between diagnostics (Space + k / j)
key("n", "<space>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
key("n", "<space>j", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Show a buffer with diagnostics (Space + d)
key("n", "<space>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Rename a variable
key("n", "<space>cw", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-------------------
-- Configuration --
-------------------

-- Disable inline diagnostics
vim.diagnostic.config({ virtual_text = false })

-- bash-language-server (Bash script)
lspconfig.bashls.setup {}

-- ccls (C, C++, Objective-C and Objective-C++)
lspconfig.ccls.setup {}

-- sumneko-lua-language-server (Lua)
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path
			},
			-- Get the language server to recognise the `vim` global
			diagnostics = { globals = { "vim" } },
			workspace = {
				-- Check third party libraries
				checkThirdParty = true,
				-- Make the server aware of Neovim runtime files
				library = { vim.api.nvim_get_runtime_file("", true) }
			},
			-- Do not send telemetry data
			telemetry = { enable = false }
		}
	}
}

-- pyright (Python)
lspconfig.pyright.setup {
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "workspace",
			useLibraryCodeForTypes = true
		}
	}
}
