require("nvim-treesitter.configs").setup {
  ensure_installed = Prog_langs_ts,
  highlight = {
    enable = true, -- "false" will disable the whole extension
    disable = { "txt" },
    additional_vim_regex_highlighting = false
  },
  indent = { enable = true },
  autotag = {
    enable = true,
    filetypes = { "html", "xml", "markdown" }
  },
  rainbow = {
    enable = true,
    extended_mode = true
  }
}
