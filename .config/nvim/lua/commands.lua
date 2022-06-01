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

local code_runner = augroup("CodeRunner", { clear = false })
local clean_remaining = augroup("CleanRemaining", { clear = false })

-- C/C++
autocmd("User Run", {
	pattern = { "*.c" },
	command = [[ !gcc -ansi -pedantic -Wall -Wextra % ; ./a.out ]],
	group = code_runner
})

autocmd("User Run", {
	pattern = { "*.C", "*.cc", "*.cp", "*.cpp", "*.cxx", "*.c++" },
	command = [[ !g++ % ; ./a.out ]],
	group = code_runner
})

-- Clean remaining executables (C and C++ binaries)
autocmd("BufUnload", {
	pattern = { "*.c", "*.C", "*.cc", "*.cp", "*.cpp", "*.cxx", "*.c++" },
	command = [[ silent !rm --force a.out ]],
	group = clean_remaining
})

-- Shell Script
autocmd("User Run", {
	pattern = "*.sh",
	command = [[ !/bin/sh  % ]],
	group = code_runner
})

-- Python
autocmd("User Run", {
	pattern = "*.py",
	command = [[ !python3 % ]],
	group = code_runner
})

-- Lua
autocmd("User Run", {
	pattern = "*.lua",
	command = [[ !lua % ]],
	group = code_runner
})

-- Run LOVE projects
usercmd("RunLove", "silent !love %:p:h", {})

-- HTML
autocmd("User Run", {
	pattern = "*.html",
	command = [[ silent !live-server %:p:h & ]],
	group = code_runner
})

-- CSS (Joke)
autocmd("User Run", {
	pattern = { "*.css", "*.scss", "*.sass" },
	callback = function() print("lol, you can't run a stylesheet") end,
	group = code_runner
})

-- Markdown
autocmd("User Run", {
	pattern = "*.md",
	command = [[ MarkdownPreview ]],
	group = code_runner
})

-- LaTeX
-- TODO: Make it handle "live editing" and export errors
autocmd("User Run", {
	pattern = "*.tex",
	-- Convert tex to pdf and send a SIGHUP signal to mupdf (to update changes)
	command = [[ echo "\"%.pdf\" PDF exported! This doesn't handle errors yet." | silent !pdflatex % -o %.pdf && pkill --signal SIGHUP mupdf ]],
	group = code_runner
})

-- Clean log and aux files (LaTeX remaining files)
autocmd("BufUnload", {
	pattern = "*.tex",
	command = [[ silent !rm --force %:p:h/*.log %:p:h/*.aux ]],
	group = clean_remaining
})

-------------------
-- Miscellaneous --
-------------------

local editor_automation = augroup("EditorAutomation", { clear = false })

-- Open help windows vertically
autocmd("FileType help", {
	command = [[ wincmd L ]],
	group = editor_automation
})

-- Remove all trailing whitespace and trim blank lines at the end of the file
autocmd("BufWritePre", {
	command = [[ %s/\s\+$//e | %s/\($\n\s*\)\+\%$//e ]],
	group = editor_automation
})

-- Remember last position and foldings
autocmd("BufWinEnter", {
	command = [[ silent! loadview ]],
	group = editor_automation
})
autocmd("BufWinLeave", {
	command = [[ mkview ]],
	group = editor_automation
})

-- Don't auto comment new lines (when open command is used)
autocmd("BufEnter", {
	command = [[ set formatoptions-=o ]],
	group = editor_automation
})

-- Packer
autocmd("BufWritePost", {
	-- Regenerate compiled loader file and load Packer everytime "plugins.lua"
	-- is written
	pattern = "plugins.lua",
	command = [[ PackerCompile ]],
	group = editor_automation
})

-- Toggle auto-formatting with nice defaults
usercmd("EnableFo", [[ set formatoptions=aw2tnp |
                       echo "Autoformat is on, set a line length with \"set textwidth=[number]\" or disable it by entering \"DisableFo\" in the command line" ]], {})
usercmd("DisableFo", [[ set formatoptions= |
                        echo "Autoformat is off" ]], {})
