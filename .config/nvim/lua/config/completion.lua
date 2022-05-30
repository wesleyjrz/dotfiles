local cmp = require("cmp")
local lspkind = require("lspkind")

-- Load LSP Kind
lspkind.init()

cmp.setup {
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<C-y>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		},
		["<C-space>"] = cmp.mapping.complete()
	},

	sources = {
		{ name = "nvim_lsp", keyword_length = 4 },
		{ name = "path" },
		{ name = "nvim_lua", keyword_length = 4 },
		{ name = "buffer", keyword_length = 4 },
		{ name = "luasnip", keyword_length = 4 }
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
