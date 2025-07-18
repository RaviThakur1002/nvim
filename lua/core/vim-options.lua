-- vim-options.lua

-------------------------------------------------------
-- General Settings
-------------------------------------------------------

-- Initialize vim.opt as a Lua table
vim.opt = vim.opt or {}

vim.o.autoread = true
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

--no swapfiles
vim.opt.swapfile = false

-------------------------------------------------------
-- Indentation and Formatting
-------------------------------------------------------

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.o.formatoptions = vim.o.formatoptions .. "cqrn"

-------------------------------------------------------
-- Basic Vim Options
-------------------------------------------------------

-- File type detection
vim.cmd("filetype on")
vim.cmd("filetype plugin on")

-- Session options
vim.opt.sessionoptions:remove("folds")

-- Terminal and display settings
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars:append({ eob = " " }) -- Turn off squiggly lines for blank lines

-------------------------------------------------------
-- Cursor Configuration
-------------------------------------------------------

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Set cursor styles
        vim.opt.guicursor = "n-v-c:block-Cursor/lCursor"
        vim.opt.guicursor:append("i-ci-ve:ver25-CursorInsert/lCursor")
        vim.opt.guicursor:append("r-cr:hor20")
        vim.opt.guicursor:append("o:hor50")
        vim.opt.guicursor:append("a:blinkwait700-blinkoff400-blinkon250")
        
        -- Set highlight groups
        vim.api.nvim_set_hl(0, "Cursor", { fg = "white", bg = "#CE93D8", bold = true })
        vim.api.nvim_set_hl(0, "CursorInsert", { fg = "black", bg = "#AB47BC" })
    end,
})

-- Cursor line highlighting
vim.opt.cursorline = true

-------------------------------------------------------
-- Floaterm Configuration
-------------------------------------------------------

vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.9
vim.g.floaterm_title = "devil($1/$2)"
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"

-------------------------------------------------------
-- File Monitoring and Auto-reload
-------------------------------------------------------

-- Autocommand to trigger checktime when files change on disk
vim.api.nvim_command([[
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
]])

-- Autocommand to display a notification after a file change
vim.api.nvim_command([[
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
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

-------------------------------------------------------
-- Auto-save Configuration
-------------------------------------------------------

-- Auto-save input1.txt on text change
vim.cmd([[
  autocmd BufWritePost ~/cp/projectone/input1.txt :wa
  autocmd TextChanged,TextChangedI ~/cp/projectone/input1.txt silent! write
]])

-------------------------------------------------------
-- Codeium Configuration
-------------------------------------------------------

-- Disable codeium for cpp files
vim.g.codeium_filetypes = {
    ["cpp"] = false,
}

-- Disable default codeium bindings
vim.cmd("let g:codeium_disable_bindings = 1")

-------------------------------------------------------
-- Commented Options (for future reference)
-------------------------------------------------------

-- vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:
-- vim.opt.foldcolumn = '1

-------------------------------------------------------
-- Module Return
-------------------------------------------------------

return true -- Important for Lua modules
