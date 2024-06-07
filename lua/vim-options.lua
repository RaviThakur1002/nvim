-- vim-options.lua
vim.cmd("filetype on")
vim.cmd("filetype plugin on")

-- Set Vim options
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoread = true
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Compile and run C++ code with redirection on F5
map('n', '<F5>', ':w | !g++ -std=c++20 -o main % && ./main<CR>' , opts)

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

-- Autocommand to trigger `checktime` when files change on disk
vim.api.nvim_command([[
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
]])

-- Autocommand to display a notification after a file change
vim.api.nvim_command([[
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

-- Shifting lines up
map('n', '<A-K>', ':m .-2<CR>==', opts)
map('i', '<A-K>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<A-K>', ":m '<-2<CR>gv=gv", opts)

-- Shifting lines down
map('n', '<A-J>', ':m .+1<CR>==', opts)
map('i', '<A-J>', '<Esc>:m .+1<CR>==gi', opts)
map('v', '<A-J>', ":m '>+1<CR>gv=gv", opts)

-- Duplicate the current line
map('n', '<A-D>', 'yyp', opts)
map('v', '<A-D>', 'y`>p`[V', opts)

return true -- Important for Lua modules

