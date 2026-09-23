
-- Reset existing highlighting variables
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "red_gray"

-- 1. Palette
local bg       = "#16161a" 
local bg_dark  = "#0f0f11" 
local fg       = "#e6e6e6" 
local selection= "#2a2a30" 
local comment  = "#62626e" 
local subtle   = "#373741" 
local red_bright = "#ff3344" 
local red_muted  = "#d64550" 

-- 2. UI Groups
local ui_groups = {
  Normal       = { fg = fg, bg = bg },
  NormalFloat  = { fg = fg, bg = bg_dark },
  CursorLine   = { bg = selection },
  ColorColumn  = { bg = selection },
  LineNr       = { fg = comment },
  CursorLineNr = { fg = red_bright, bold = true },
  VertSplit    = { fg = subtle, bg = bg },
  WinSeparator = { fg = subtle },
  Visual       = { bg = selection },
  Search       = { fg = bg, bg = red_bright, bold = true },
  IncSearch    = { fg = bg, bg = red_bright, bold = true },
  StatusLine   = { fg = fg, bg = bg_dark },
  StatusLineNC = { fg = comment, bg = bg_dark },
  Pmenu        = { fg = fg, bg = bg_dark },
  PmenuSel     = { fg = bg, bg = red_muted },
}

-- 3. Syntax Groups
local syntax_groups = {
  Comment      = { fg = comment, italic = true },
  Constant     = { fg = fg },
  String       = { fg = fg }, 
  Character    = { fg = red_muted },
  Number       = { fg = fg },
  Boolean      = { fg = red_bright, bold = true },
  Float        = { fg = fg },
  Identifier   = { fg = fg },
  Function     = { fg = red_muted }, 
  Statement    = { fg = red_bright, bold = true }, 
  Conditional  = { fg = red_bright, bold = true }, 
  Repeat       = { fg = red_bright, bold = true },
  Label        = { fg = red_bright },
  Operator     = { fg = fg },
  Keyword      = { fg = red_bright, bold = true }, 
  Exception    = { fg = red_bright, bold = true },
  PreProc      = { fg = comment },
  Include      = { fg = red_bright },
  Define       = { fg = red_bright },
  Macro        = { fg = red_bright },
  Type         = { fg = fg, bold = true },
  StorageClass = { fg = red_bright },
  Structure    = { fg = red_bright },
  Typedef      = { fg = red_bright },
  Special      = { fg = red_muted },
  SpecialChar  = { fg = red_muted },
  Tag          = { fg = red_bright },
  Delimiter    = { fg = comment },
  Debug        = { fg = red_bright },
  Underlined   = { underline = true },
  Bold         = { bold = true },
  Italic       = { italic = true },
  Error        = { fg = "#ffffff", bg = red_bright, bold = true },
  Todo         = { fg = bg, bg = red_bright, bold = true },
}

-- 4. Tree-sitter modern engine support
local treesitter_groups = {
  ["@keyword"]       = { fg = red_bright, bold = true },
  ["@function"]      = { fg = red_muted },
  ["@function.builtin"] = { fg = red_bright },
  ["@variable"]      = { fg = fg },
  ["@variable.builtin"] = { fg = red_muted },
  ["@constant"]      = { fg = fg },
  ["@comment"]       = { fg = comment, italic = true },
  ["@parameter"]     = { fg = fg },
  ["@field"]         = { fg = fg },
  ["@property"]      = { fg = fg },
  ["@constructor"]   = { fg = red_muted },
}

-- 5. Bracket / indent-guide groups, used by indent-blankline.
local delimiter_groups = {
  RainbowDelimiterRed   = { fg = red_bright },
  RainbowDelimiterWhite = { fg = fg },

  RainbowRed   = { fg = red_bright },
  RainbowWhite = { fg = fg },

  IblIndent = { fg = subtle },
}

local function apply(groups)
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

apply(ui_groups)
apply(syntax_groups)
apply(treesitter_groups)
apply(delimiter_groups)
