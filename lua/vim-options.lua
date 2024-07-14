-- vim-options.lua
vim.cmd("filetype on")
vim.cmd("filetype plugin on")

-- Cursor settings
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

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoread = true
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true

-- cursor line
vim.opt.cursorline = true  -- highlight the current cursor line

vim.opt.autoindent = true  -- Enable automatic indentation
vim.opt.smartindent = true -- Enable smart indenting

vim.o.formatoptions = vim.o.formatoptions .. "cqrn"

-- Autocommand to trigger checktime when files change on disk
vim.api.nvim_command([[
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
]])

-- Autocommand to display a notification after a file change
vim.api.nvim_command([[
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

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

-- codeium off cpp
vim.g.codeium_filetypes = {
    ["cpp"] = false,
}
vim.cmd("let g:codeium_disable_bindings = 1")


-- vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:
-- vim.opt.foldcolumn = '1

return true -- Important for Lua modules

