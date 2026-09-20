return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = false },
        })
    end,
}
