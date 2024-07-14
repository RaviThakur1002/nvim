return {
  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('tabout').setup {
        tabkey = '<C-l>', -- Changed to Ctrl+L
        backwards_tabkey = '<C-h>', -- Changed to Ctrl+H
        act_as_tab = false, -- Changed to false
        act_as_shift_tab = false,
        enable_backwards = true,
        completion = true, -- Changed to true
        tabouts = {
          {open = '(', close = ')'},
          {open = '[', close = ']'},
          {open = '{', close = '}'},
          {open = '"', close = '"'},
          {open = "'", close = "'"},
          {open = '`', close = '`'}
        },
        ignore_beginning = false, -- Changed to false
        exclude = {},
      }
    end,
    wants = {'nvim-treesitter'}, -- Specify that we want nvim-treesitter
    after = {'nvim-cmp'}, -- Load after nvim-cmp
  },
  -- Remove the LuaSnip configuration if it's causing conflicts
}
