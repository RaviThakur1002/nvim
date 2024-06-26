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
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true
-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line


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

-- Autocommand to trigger checktime when files change on disk
vim.api.nvim_command([[
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
]])

-- Autocommand to display a notification after a file change
vim.api.nvim_command([[
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

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

-- Auto-save input1.txt on text change
vim.cmd([[
  autocmd BufWritePost ~/projectone/input1.txt :wa
  autocmd TextChanged,TextChangedI ~/projectone/input1.txt silent! write
]])

-- Function to periodically check for updates
if vim.g.CheckUpdateStarted == nil then
    vim.g.CheckUpdateStarted = 1
    vim.fn.timer_start(1, function()
        CheckUpdate()
    end)
end

function CheckUpdate()
    vim.cmd("silent! checktime")
    vim.fn.timer_start(1000, function()
        CheckUpdate()
    end)
end

-- Key mappings for tabs
map("n", "<Leader>to", ":tabnew<CR>", opts)
map("n", "<Leader>tx", ":tabclose<CR>", opts)
map("n", "<Leader>tn", ":tabn<CR>", opts)
map("n", "<Leader>tp", ":tabp<CR>", opts)
map("n", "<Leader>tf", ":tabnew %<CR>", opts)

return true -- Important for Lua modules
