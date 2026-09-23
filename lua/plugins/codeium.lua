return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        manual = false,
        filetypes = {
          cpp = false, -- disable for cpp specifically
        },
        default_filetype_enabled = true, -- enabled everywhere else
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
