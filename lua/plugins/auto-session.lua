return {
  "rmagatti/auto-session",
  dependencies = {
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    -- Set sessionoptions to include localoptions
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    
    local auto_session = require("auto-session")
    
    -- Set notify as the default notifier
    vim.notify = require("notify")
    
    -- Function to safely close nvim-tree
    local function safe_tree_close()
      local nvim_tree = require("nvim-tree")
      local ok, _ = pcall(nvim_tree.close)
      if not ok then
        vim.notify("Failed to close nvim-tree", vim.log.levels.WARN)
      end
    end
    
    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      pre_save_cmds = { safe_tree_close },  -- Only close tree before saving
      -- Removed post_restore_cmds so nvim-tree won't auto-open
      auto_session_use_git_branch = true,
      log_level = "info",
      notification_enable = true
    })
    
    local keymap = vim.keymap
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
  end,
}
