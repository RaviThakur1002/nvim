-- rainbow.lua

return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require 'rainbow-delimiters'

    -- Define custom highlight groups with the provided colors
    vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#FF70AB' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#FFDB5C' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#A0DEFF' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#FFAF61' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#C3FF93' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#FF204E' })

    -- Configure rainbow-delimiters.nvim
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
      },
    }
  end,
}

