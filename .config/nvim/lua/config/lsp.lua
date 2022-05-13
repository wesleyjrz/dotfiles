local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-----------------
-- Keymappings --
-----------------

key("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Navigate between diagnostics
key("n", "<space>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
key("n", "<space>j", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Add buffer diagnostics to the location list
-- (Show the buffer with all diagnostics)
key("n", "<space>l", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-------------------
-- Configuration --
-------------------

-- Disable inline diagnostics
vim.diagnostic.config({ virtual_text = false })

-- bash-language-server (Bash script)
require("lspconfig").bashls.setup {}

-- clangd (C, C++, Objective-C and Objective-C++)
require("lspconfig").clangd.setup {}

-- sumneko-lua-language-server (Lua)
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = "5.2",
        -- Setup your lua path
        path = runtime_path
      },
      -- Get the language server to recognise the `vim` global
      diagnostics = { globals = { "vim" } },
      -- Make the server aware of Neovim runtime files
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      -- Do not send telemetry data
      telemetry = { enable = false }
    }
  },
}

-- pyright (Python)
require("lspconfig").pyright.setup {
  python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
}
