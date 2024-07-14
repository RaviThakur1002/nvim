-- keymaps.lua

-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Compile and run C++ code with redirection on F5
map("n", "<F5>", ":w | !g++ -std=c++20 -o main % && ./main<CR>", opts)

-- Run JavaScript file with Node.js on F6
map("n", "<F6>", ":w<CR>:!node %<CR>", opts)

-- Define RunJS command
vim.api.nvim_create_user_command("RunJS", function()
	-- Save the current file
	vim.cmd("w")
	-- Get the current file name
	local file = vim.fn.expand("%")
	-- Run the file using Node.js
	vim.cmd("!node " .. file)
end, {})

-- Shifting lines up
map("n", "<A-K>", ":m .-2<CR>==", opts)
map("i", "<A-K>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-K>", ":m '<-2<CR>gv=gv", opts)

-- Shifting lines down
map("n", "<A-J>", ":m .+1<CR>==", opts)
map("i", "<A-J>", "<Esc>:m .+1<CR>==gi", opts)
map("v", "<A-J>", ":m '>+1<CR>gv=gv", opts)

-- Duplicate the current line
map("n", "<A-D>", "yyp", opts)
map("v", "<A-D>", "y`>p`[V", opts)

-- Key mappings for tabs
map("n", "<Leader>to", ":tabnew<CR>", opts)
map("n", "<Leader>tx", ":tabclose<CR>", opts)
map("n", "<Leader>tn", ":tabn<CR>", opts)
map("n", "<Leader>tp", ":tabp<CR>", opts)
map("n", "<Leader>tf", ":tabnew %<CR>", opts)

-- Floaterm key mappings
map("n", "<Leader>f", ":FloatermNew<CR>", opts)
map("n", "<Leader>h", ":FloatermToggle<CR>", opts)
map("n", "<Leader>fn", ":FloatermNext<CR>", opts)
map("n", "<Leader>fp", ":FloatermPrev<CR>", opts)

-- CellularAutomaton mappings
map("n", "<Leader>fml", ":CellularAutomaton make_it_rain<CR>", opts)
map("n", "<Leader>fmg", ":CellularAutomaton game_of_life<CR>", opts)

-- No highlight
map("n", "<S-N>", ":nohlsearch<CR>", opts)

-- Key mappings for change directory plugins
map("n", "<Leader>cdp", ":CdProject<CR>", opts)
map("n", "<Leader>cda", ":CdProjectAdd<CR>", opts)
map("n", "<Leader>cde", ":CdProjectDelete<CR>", opts)
map("n", "<Leader>cdm", ":CdProjectManualAdd<CR>", opts)
map("n", "<Leader>cdb", ":CdProjectBack<CR>", opts)
map("n", "<Leader>cds", ":CdProjectSearchAndAdd<CR>", opts)
map("n", "<Leader>cdt", ":CdProjectTab<CR>", opts)

return true -- Important for Lua modules
