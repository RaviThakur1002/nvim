-- keymaps.lua

-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Compile and run C++ code with redirection on F5
map('n', '<F5>', ':w | silent! !g++ -std=c++17 -o main % && ./main<CR>', { noremap = true, silent = true })


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
map("n", "<F7>", ":FloatermNew<CR>", opts)
map("t", "<F7>", "<C-\\><C-n>:FloatermNew<CR>", opts)
map("n", "<F8>", ":FloatermPrev<CR>", opts)
map("t", "<F8>", "<C-\\><C-n>:FloatermPrev<CR>", opts)
map("n", "<F9>", ":FloatermNext<CR>", opts)
map("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>", opts)
map("n", "<F12>", ":FloatermToggle<CR>", opts)
map("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", opts)

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


-- Toggle between split windows using Leader + custom keys
map("n", "<Leader>lt", "<C-w>h", opts)  -- Move to the left window
map("n", "<Leader>ll", "<C-w>l", opts)  -- Move to the right window
map("n", "<Leader>kk", "<C-w>k", opts)  -- Move to the upper window
map("n", "<Leader>jj", "<C-w>j", opts)  -- Move to the lower window

--ZenMode
map("n", "<A-z>", ":ZenMode<CR>", opts)

-- C++ Template
map("n" ,"<Leader>cp",":CPTemplate<CR>",opts)

-- ──────────────────────────── REPLACEMENTS ─────────────────────────

-- Range-Based Replacement
function RangeReplace()
  local start_line = tonumber(vim.fn.input("Start Line: "))
  local end_line = tonumber(vim.fn.input("End Line: "))
  if not start_line or not end_line or start_line > end_line then
    print("Invalid line range")
    return
  end
  local search_word = vim.fn.input("Replace: ")
  local replace_word = vim.fn.input("With: ")
  local cmd = string.format("%d,%ds/%s/%s/g", start_line, end_line, search_word, replace_word)
  local ok, err = pcall(vim.cmd, cmd)
  if not ok then
    print("Error executing command: " .. err)
  else
    vim.cmd("nohlsearch")
  end
end

map("n", "<leader>rr", ":lua RangeReplace()<CR>", opts)


-- ──────────────────────────────────────────────────────────────────────

-- Mapping jj to escape
map("i", "jj", "<ESC>", opts)

--Tabline(lualine) keymaps
for i = 1, 9 do 
  map("n", "<leader>" .. i, ":LualineBuffersJump" .. i .. "<CR>", opts)
end

map("n" , "<leader>0" , ":LualineBuffersJump $<CR>", opts) -- jump to last buffer

return true -- Important for Lua modules
