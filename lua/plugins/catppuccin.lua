return {
  {
     "catppuccin/nvim",
    lazy = false,
    name = "catppuccin-mocha",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "github_dark_tritanopia"
    end
  }
}
