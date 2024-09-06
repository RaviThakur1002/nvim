return {
  {
    "bagrat/vim-buffet",
    event = "VeryLazy",
    config = function()
      vim.g.buffet_powerline_separators = 1
      vim.g.buffet_always_show_tabline = 0

      -- Key mappings
      for i = 1, 9 do
        vim.api.nvim_set_keymap('n', string.format('<Leader>%d', i), string.format('<Plug>BuffetSwitch(%d)', i), { noremap = true, silent = true })
      end
      vim.api.nvim_set_keymap('n', '<Leader>0', '<Plug>BuffetSwitch(10)', { noremap = true, silent = true })

      -- Function to get highlight group colors
      local function get_color(hl_group, attribute)
        local color = vim.api.nvim_get_hl_by_name(hl_group, true)[attribute]
        return color and string.format("#%06x", color) or nil
      end

      -- Function to invert color
      local function invert_color(color)
        if color then
          local r, g, b = tonumber(color:sub(2,3), 16), tonumber(color:sub(4,5), 16), tonumber(color:sub(6,7), 16)
          return string.format("#%02x%02x%02x", 255 - r, 255 - g, 255 - b)
        end
        return nil
      end

      -- Function to blend two colors
      local function blend_colors(c1, c2, ratio)
        local r1, g1, b1 = tonumber(c1:sub(2,3), 16), tonumber(c1:sub(4,5), 16), tonumber(c1:sub(6,7), 16)
        local r2, g2, b2 = tonumber(c2:sub(2,3), 16), tonumber(c2:sub(4,5), 16), tonumber(c2:sub(6,7), 16)
        local r = math.floor(r1 * (1-ratio) + r2 * ratio)
        local g = math.floor(g1 * (1-ratio) + g2 * ratio)
        local b = math.floor(b1 * (1-ratio) + b2 * ratio)
        return string.format("#%02x%02x%02x", r, g, b)
      end

      -- Custom color function based on the current Neovim theme
      local function set_buffet_colors()
        local bg = get_color("Normal", "background") or "#1a1a1a"
        local fg = get_color("Normal", "foreground") or "#f0e0d0"
        
        local active_bg = fg
        local active_fg = bg
        local inactive_bg = bg
        local inactive_fg = fg
        local visible_bg = blend_colors(bg, fg, 0.2)
        local visible_fg = fg

        vim.cmd(string.format([[
          hi! BuffetCurrentBuffer guibg=%s guifg=%s gui=bold
          hi! BuffetActiveBuffer guibg=%s guifg=%s
          hi! BuffetBuffer guibg=%s guifg=%s
          hi! BuffetTab guibg=%s guifg=%s
          hi! BuffetTrunc guibg=%s guifg=%s
        ]],
          active_bg, active_fg,
          visible_bg, visible_fg,
          inactive_bg, inactive_fg,
          bg, blend_colors(fg, bg, 0.5),
          bg, fg
        ))
      end

      -- Set the custom color function as a Vim global function
      vim.g.BuffetSetCustomColors = set_buffet_colors

      -- Call the function to set colors
      set_buffet_colors()

      -- Autocommand to reset colors when the colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          set_buffet_colors()
        end,
      })

      -- Hide tabline when only one tab is open
      vim.o.showtabline = 0
    end,
  }
}
