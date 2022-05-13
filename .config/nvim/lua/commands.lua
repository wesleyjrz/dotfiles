local key = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local usercmd = vim.api.nvim_create_user_command

-----------------
-- Code runner --
-----------------

-- Generated executables will be auto removed when the buffer is
-- unload (closing the buffer or the program)

-- Map code runner (Ctrl + Alt + r)
key("n", "<C-A-r>", "<cmd>doautocmd User<CR>", { silent = true })

-- C/C++
autocmd("User Run", {
  pattern = { "*.c" },
  command = [[ !gcc % ; ./a.out ]]
})

autocmd("User Run", {
  pattern = { "*.C", "*.cc", "*.cp", "*.cpp", "*.cxx", "*.c++" },
  command = [[ !g++ % ; ./a.out ]]
})

autocmd("BufUnload", {
  -- clean remanescent executables
  pattern = { "*.c", "*.C", "*.cc", "*.cp", "*.cpp", "*.cxx", "*.c++" },
  command = [[ silent !rm --force a.out ]]
})

-- Shell Script
autocmd("User Run", {
  pattern = { "*.sh" },
  command = [[ !/bin/sh  % ]]
})

-- Python
autocmd("User Run", {
  pattern = { "*.py" },
  command = [[ !python3 % ]]
})

-- Lua
autocmd("User Run", {
  pattern = { "*.lua" },
  command = [[ !lua % ]]
})

-- HTML
autocmd("User Run", {
  pattern = { "*.html" },
  command = [[ silent !$BROWSER % ]]
})

-- CSS (Joke)
autocmd("User Run", {
  pattern = { "*.css", "*.scss", "*.sass" },
  callback = function() print("lol, you can't run a stylesheet") end
})

-- Markdown
autocmd("User Run", {
  pattern = { "*.md" },
  command = [[ MarkdownPreview ]]
})

-- LaTeX
autocmd("User Run", {
  pattern = { "*.tex" },
  -- Convert tex to pdf and send a SIGHUP signal to mupdf (to update changes)
  command = [[ silent !pdflatex % -o %.pdf && pkill --signal SIGHUP mupdf ]]
})

autocmd("BufUnload", {
  pattern = { "*.tex" },
  -- clean log and aux files
  command = [[ silent !rm --force %:p:h/*.log %:p:h/*.aux ]]
})

-------------------
-- Miscellaneous --
-------------------

-- Open help windows vertically
autocmd("FileType help", {
  command = [[ wincmd L ]]
})

-- Remove all trailing whitespace,
-- Trim blank lines at the end of the file
-- and replace tabs with spaces on save
autocmd("BufWritePre", {
  command = [[ %s/\s\+$//e | %s/\($\n\s*\)\+\%$//e | silent retab! ]]
})

-- Don't auto comment new lines
autocmd("BufEnter", { command = [[ set formatoptions-=cro ]] })

-- Packer
autocmd("BufWritePost", {
  -- Regenerate compiled loader file and load
  -- Packer everytime "plugins.lua" is written
  pattern = { "plugins.lua" },
  command = [[ PackerCompile ]]
})

autocmd("BufEnter", {
  -- Load Packer when "plugins.lua" is opened
  pattern = { "plugins.lua" },
  command = [[ silent LoadPacker ]]
})

-- I need a better HTTP server that runs in background and updates automatically...
-- Start HTTP server
-- usercmd("HttpServer", "silent !simple-http-server --index --ip 127.0.0.1 --port 8080 --open --silent %:p:h &", {})

-- Run LOVE project
usercmd("RunLove", "silent !love %:p:h", {})
