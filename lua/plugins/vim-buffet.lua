return {
  {
    "bagrat/vim-buffet",
    event = "VeryLazy",
    config = function()
      vim.g.buffet_powerline_separators = 1
      vim.g.buffet_always_show_tabline = 0
      
      -- Key mappings (unchanged)
      vim.api.nvim_set_keymap('n', '<Leader>1', '<Plug>BuffetSwitch(1)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>2', '<Plug>BuffetSwitch(2)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>3', '<Plug>BuffetSwitch(3)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>4', '<Plug>BuffetSwitch(4)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>5', '<Plug>BuffetSwitch(5)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>6', '<Plug>BuffetSwitch(6)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>7', '<Plug>BuffetSwitch(7)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>8', '<Plug>BuffetSwitch(8)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>9', '<Plug>BuffetSwitch(9)', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<Leader>0', '<Plug>BuffetSwitch(10)', {noremap = true, silent = true})

      
      -- Custom color function
      local function set_buffet_colors()
        local colors = {
          deep_purple = "#4A148C",
          purple = "#6A1B9A",
          medium_purple = "#8E24AA",
          light_purple = "#AB47BC",
          very_light_purple = "#CE93D8",
          pale_purple = "#E1BEE7",
          shaded_purple = "#da25c8",
        }
        
        vim.cmd(string.format([[
          hi! BuffetCurrentBuffer guibg=%s guifg=%s gui=bold
          hi! BuffetActiveBuffer guibg=%s guifg=%s
          hi! BuffetBuffer guibg=%s guifg=%s
          hi! BuffetTab guibg=%s guifg=%s
          hi! BuffetTrunc guibg=%s guifg=%s
        ]],
          colors.deep_purple, colors.pale_purple,
          colors.purple, colors.very_light_purple,
         colors.very_light_purple, colors.deep_purple, 
          colors.light_purple, colors.deep_purple,
          colors.shaded_purple, colors.very_light_purple
        ))
      end
      
      -- Set the custom color function as a Vim global function
      vim.g.BuffetSetCustomColors = set_buffet_colors
      
      -- Call the function to set colors
      set_buffet_colors()
       vim.o.showtabline = 0
    end,
  }
}
