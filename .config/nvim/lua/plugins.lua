--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

-- Supported programming languages list to enable development plugins
require("config.prog-langs")

-- Get configuration function
local function get_config(name)
	return string.format("require(\"config.%s\")", name)
end

---------------
-- Bootstrap --
---------------

local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
end

-------------
-- Plugins --
-------------

return require("packer").startup(function(use)
	-- Packer (managed by itself)
	use "wbthomason/packer.nvim"

	-- Treesitter: incremental parsing of buffers
	use {
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		ft = ProgLangs,
		run = ":TSUpdate",
		config = get_config("treesitter")
	}

	-- Autopair: close pairs automatically
	use {
		"windwp/nvim-autopairs",
		opt = true,
		ft = ProgLangs,
		requires = "nvim-treesitter/nvim-treesitter",
		config = get_config("autopairs")
	}

	-- Autotag: close tags automatically
	use {
		"windwp/nvim-ts-autotag",
		opt = true,
		ft = { "html", "xml", "markdown" },
		requires = "nvim-treesitter/nvim-treesitter"
	}

	-- Rainbow brackets: colourful brackets
	use {
		"p00f/nvim-ts-rainbow",
		opt = true,
		ft = ProgLangs,
		requires = "nvim-treesitter/nvim-treesitter"
	}

	-- Comment: comment and uncomment easily
	use {
		"numToStr/Comment.nvim",
		opt = true,
		ft = ProgLangs,
		requires = "nvim-treesitter/nvim-treesitter",
		config = get_config("comment")
	}

	-- Terminal: toggle Neovim terminal window
	use {
		"s1n7ax/nvim-terminal",
		config = get_config("terminal")
	}

	-- Stabilize: buffer content stabilizer
	use {
		"luukvbaal/stabilize.nvim",
		config = function () require("stabilize").setup() end
	}

	-- Statusline
	use {
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"arkav/lualine-lsp-progress"
		},
		config = get_config("lualine")
	}

	-- Zen Mode: code without any distractions
	use {
		"folke/zen-mode.nvim",
		config = get_config("zen")
	}

	-- Barbar: buffer tabs
	use {
		"romgrk/barbar.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = get_config("barbar")
	}

	-- Colorizer: highlight colour codes
	use {
		"norcalli/nvim-colorizer.lua",
		opt = true,
		ft = ProgLangs,
		config = get_config("colour")
	}

	-- Nord: a superb theme
	use {
		"shaunsingh/nord.nvim",
		config = get_config("nord")
	}

	-- mkdir: create missing directories when saving a file
	use "jghauser/mkdir.nvim"

	-- LSP config: configure Neovim Language Server Protocols
	use {
		"neovim/nvim-lspconfig",
		opt = true,
		-- NOTE: I don't have a LSP installed for all languages on my list
		ft = ProgLangs,
		config = get_config("lsp")
	}

	-- nvim-cmp: completion engine
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			-- LSP autocompletion
			{ "hrsh7th/cmp-nvim-lsp", opt = true, ft = ProgLangs },

			-- Path autocompletion
			{ "hrsh7th/cmp-path", opt = true, ft = ProgLangs },

			-- Neovim Lua autocompletion
			{ "hrsh7th/cmp-nvim-lua", opt = true, ft = "lua" },

			-- Buffer words autocompletion
			"hrsh7th/cmp-buffer",

			-- VSC-like pictograms
			"onsails/lspkind.nvim"
		},
		config = get_config("completion")
	}

	-- LuaSnip: snippet engine
	use {
		"L3MON4D3/LuaSnip",
		opt = true,
		ft = ProgLangs,
		requires = {
			-- Autocompletion support
			{ "saadparwaiz1/cmp_luasnip", opt = true, ft = ProgLangs },
		},
		config = get_config("snippets")
	}

	-- Preconfigured snippets
	use {
		"rafamadriz/friendly-snippets",
		opt = true,
		ft = ProgLangs
	}

	-- Carbon Now: generate carbon snippets from selection
	use {
		"ellisonleao/carbon-now.nvim",
		opt = true,
		ft = ProgLangs,
		config = get_config("carbon")
	}

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
