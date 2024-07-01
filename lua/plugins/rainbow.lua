-- rainbow.lua

return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require 'rainbow-delimiters'

    -- Define custom highlight groups with the provided colors
    vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#e07ce5' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#8cee88' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#c38ed5' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#70ccc3' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#f47550' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#3ba8e9' })

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

