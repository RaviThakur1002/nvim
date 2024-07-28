return {
    "dcampos/nvim-snippy",
    config = function()
        require("snippy").setup({
            mappings = {
                is = {
                    ["<Tab>"] = "expand_or_advance",
                    ["<S-Tab>"] = "previous",
                },
                nx = {
                    ["<leader>x"] = "cut_text",
                },
            },
            snippet_dirs = {
                "~/.config/nvim/snippets",
            },
            load_ft_snippets = true,
            extend_ft_snippets = {
                cpp = {"cpp", "hashing"}, -- Ensure "cpp" is also included
            },
        })
    end,
}

