require("nvim-autopairs").setup {
  check_ts = true,                  -- use treesitter
  disable_in_macro = true,          -- disable when recording a macro
  enable_check_bracket_line = true  -- don't add pairs if it has already a close pair in the same line
}
