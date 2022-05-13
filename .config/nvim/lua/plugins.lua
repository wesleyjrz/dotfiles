local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

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
    config = function () require("config.treesitter") end
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function () require("config.autopairs") end
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
    config = function() require("config.comment") end
  }

  -- Automatically make missing directories when saving a file,
  -- works like `mkdir -p` on Linux.
  use { "jghauser/mkdir.nvim" }

  -- LSP config
  use {
    "neovim/nvim-lspconfig",
    config = function() require("config.lsp") end
  }

  -- Markdown preview
  -- use {
  --   opt = true,
  --   ft = "markdown",
  --   config = function () require("config.markdown-preview") end
  -- }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function () require("config.lualine") end
  }

  -- Tabs
  use {
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function () require("config.barbar") end
  }

  -- Nord theme
  use {
    "shaunsingh/nord.nvim",
    config = function () require("config.nord") end
  }

  if Packer_bootstrap then
    require("packer").sync()
  end
end)
