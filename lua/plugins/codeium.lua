return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      enable_cmp_source = false, -- set true if you use nvim-cmp for completions instead of virtual text
      virtual_text = {
        enabled = true,
        manual = false,
        key_bindings = {
          accept = "<C-g>",
          next = "<c-;>",
          prev = "<c-,>",
          clear = "<c-x>",
        },
      },
    })
  end,
}
