local lspconfig = require("lspconfig")
local key = vim.api.nvim_set_keymap
local opts = { noremap = true }

-------------
-- Keymaps --
-------------

-- Open diagnostic floating window (Space)
key("n", "<space>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Navigate between diagnostics (Space + p/n)
key("n", "<space>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
key("n", "<space>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Show a buffer with all diagnostics (Ctrl + Space)
key("n", "<C-space>", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Rename a variable (Space + cw)
key("n", "<space>cw", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- Display all references for the symbol (Space + f)
key("n", "<space>f", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

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
