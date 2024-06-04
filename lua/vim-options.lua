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

return true -- Important for Lua modules
