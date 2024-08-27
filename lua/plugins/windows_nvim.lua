return {
   {
      "anuvyklack/windows.nvim",
      dependencies = {
         "anuvyklack/middleclass",
         "anuvyklack/animation.nvim",
      },
      config = function()
         vim.o.winwidth = 10
         vim.o.winminwidth = 10
         vim.o.equalalways = false
         require("windows").setup()
      end,
   },
   -- colorful winsep
   {
      "nvim-zh/colorful-winsep.nvim",
      config = true,
      event = { "WinNew", "WinLeave", "WinEnter" }, -- Added more events to trigger the plugin
   },
}
