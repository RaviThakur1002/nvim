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

--Floaterm key mappings
map("n", "<Leader>f", ":FloatermNew<CR>", opts)
map("n", "<Leader>h", ":FloatermToggle<CR>", opts)
map("n", "<Leader>fn", ":FloatermNext<CR>", opts)
map("n", "<Leader>fp", ":FloatermPrev<CR>", opts)


--cellular mappings
map("n", "<Leader>fml", ":CellularAutomaton make_it_rain<CR>", opts)
map("n", "<Leader>fmg", ":CellularAutomaton game_of_life<CR>", opts)


-- codeium off cpp
vim.g.codeium_filetypes = {
    ["cpp"] = false,
}
vim.cmd("let g:codeium_disable_bindings = 1")

return true -- Important for Lua modules
