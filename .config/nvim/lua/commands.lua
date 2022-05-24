local key = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local usercmd = vim.api.nvim_create_user_command

-----------------
-- Code runner --
-----------------

-- Generated executables will be auto removed when the buffer is unload
-- (closing the buffer or the program)

-- Map code runner (Ctrl + Alt + r)
key("n", "<C-A-r>", "<cmd>doautocmd User<CR>", { silent = true })

-- C/C++
autocmd("User Run", {
	pattern = { "*.c" },
	command = [[ !gcc -ansi -pedantic -Wall -Wextra % ; ./a.out ]]
})

autocmd("User Run", {
	pattern = { "*.C", "*.cc", "*.cp", "*.cpp", "*.cxx", "*.c++" },
	command = [[ !g++ % ; ./a.out ]]
})

autocmd("BufUnload", {
	-- Clean remanescent executables
	pattern = { "*.c", "*.C", "*.cc", "*.cp", "*.cpp", "*.cxx", "*.c++" },
	command = [[ silent !rm --force a.out ]]
})

-- Shell Script
autocmd("User Run", {
	pattern = "*.sh",
	command = [[ !/bin/sh  % ]]
})

-- Python
autocmd("User Run", {
	pattern = "*.py",
	command = [[ !python3 % ]]
})

-- Lua
autocmd("User Run", {
	pattern = "*.lua",
	command = [[ !lua % ]]
})

-- HTML
autocmd("User Run", {
	pattern = "*.html",
	command = [[ silent !live-server %:p:h & ]]
})

-- CSS (Joke)
autocmd("User Run", {
	pattern = { "*.css", "*.scss", "*.sass" },
	callback = function() print("lol, you can't run a stylesheet") end
})

-- Markdown
autocmd("User Run", {
	pattern = "*.md",
	command = [[ MarkdownPreview ]]
})

-- LaTeX
autocmd("User Run", {
	pattern = "*.tex",
	-- Convert tex to pdf and send a SIGHUP signal to mupdf (to update changes)
	command = [[ silent !pdflatex % -o %.pdf && pkill --signal SIGHUP mupdf ]]
})

autocmd("BufUnload", {
	pattern = "*.tex",
	-- Clean log and aux files
	command = [[ silent !rm --force %:p:h/*.log %:p:h/*.aux ]]
})

-------------------
-- Miscellaneous --
-------------------

-- Open help windows vertically
autocmd("FileType help", {
	command = [[ wincmd L ]]
})

-- Remove all trailing whitespace and trim blank lines at the end of the file
autocmd("BufWritePre", {
	command = [[ %s/\s\+$//e | %s/\($\n\s*\)\+\%$//e ]]
})

-- Don't auto comment new lines (when open command is used)
autocmd("BufEnter", { command = [[ set formatoptions-=o ]] })

-- Packer
autocmd("BufWritePost", {
	-- Regenerate compiled loader file and load Packer everytime "plugins.lua"
	-- is written
	pattern = "plugins.lua",
	command = [[ PackerCompile ]]
})

-- Run LOVE project
usercmd("RunLove", "silent !love %:p:h", {})

-- Toggle auto-formatting with nice defaults
usercmd("EnableFo", [[ set formatoptions=aw2tnp |
                       echo "Autoformat is on, set a line length with \"set textwidth=[number]\" or disable it by entering \"DisableFo\" in the command line" ]], {})
usercmd("DisableFo", [[ set formatoptions= |
                        echo "Autoformat is off" ]], {})
