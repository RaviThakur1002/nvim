return {
   "folke/todo-comments.nvim",
   event = "VimEnter", -- changed from BufReadPre/BufNewFile to VimEnter
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = { signs = true }, -- using opts instead of config function
}
