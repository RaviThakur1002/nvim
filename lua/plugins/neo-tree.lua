return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Your existing keymapping
    vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})

    -- Add the Neo-tree setup configuration
    require("neo-tree").setup({
      filesystem = {
        use_libuv_file_watcher = true,  -- This is the line you were looking for
        follow_current_file = {
          enabled = true,
        },
      },
    })
  end
}
