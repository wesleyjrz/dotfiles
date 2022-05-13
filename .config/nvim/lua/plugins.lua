local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

-- Returns require function in Packer "config" parameter
local function get_config(name)
  return string.format("require(\"config.%s\")", name)
end

-------------------
-- Configuration --
-------------------

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
end

-------------
-- Plugins --
-------------

return require("packer").startup(function(use)
  -- Let Packer manage itself
  use "wbthomason/packer.nvim"

  -- Treesitter configuration and abstraction layer
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_config("treesitter")
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    requires = "nvim-treesitter/nvim-treesitter",
    config = get_config("autopairs")
  }

  -- Autotag
  use {
    "windwp/nvim-ts-autotag",
    opt = true,
    ft = { "html", "xml", "markdown" },
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -- Rainbow brackets
  use {
    "p00f/nvim-ts-rainbow",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -- Comment and uncomment easily
  use {
    "numToStr/Comment.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    config = get_config("comment")
  }

  -- Automatically make missing directories when saving a file,
  -- works like `mkdir -p` on Linux.
  use "jghauser/mkdir.nvim"

  -- LSP config
  use {
    "neovim/nvim-lspconfig",
    config = get_config("lsp")
  }

  -- Markdown preview
  use {
    "davidgranstrom/nvim-markdown-preview",
    opt = true,
    ft = "markdown"
  }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = get_config("lualine")
  }

  -- Tabs
  use {
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = get_config("barbar")
  }

  -- Nord theme
  use {
    "shaunsingh/nord.nvim",
    config = get_config("nord")
  }

  if Packer_bootstrap then
    require("packer").sync()
  end
end)
