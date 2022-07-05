local cmp = require("cmp")
local lspkind = require("lspkind")

-- Load LSP Kind
lspkind.init()

cmp.setup {
	mapping = {
		["<C-j>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<C-k>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<C-e>"] = cmp.mapping.close(),
		["<C-l>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		},
		["<C-space>"] = cmp.mapping.complete()
	},

	sources = {
		{ name = "path", keyword_length = 2 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "nvim_lua", keyword_length = 2 },
		{ name = "buffer", keyword_length = 4 }
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},

	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]"
			}
		}
	},

	experimental = {
		ghost_text = true
	}
}
