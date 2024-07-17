return {
    -- ╭───────────╮
    -- │ multiline │
    -- ╰───────────╯

    {
        "mg979/vim-visual-multi",
    },

    -- ╭───────╮
    -- │ muren │
    -- ╰───────╯

    {
        "AckslD/muren.nvim",
        config = true,
    },

    -- ╭────────────────╮
    -- │ nerd-commenter │
    -- ╰────────────────╯

    {
        "preservim/nerdcommenter",
    },

    -- ╭───────────────╮
    -- │ smooth Cursor │
    -- ╰───────────────╯
    {
        "gen740/SmoothCursor.nvim",
        config = function()
            require("smoothcursor").setup()
        end,
    },

    -- ╭──────────────╮
    -- │ surround     │
    -- ╰──────────────╯
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = true,
    },

    -- ╭──────────╮
    -- │ twilight │
    -- ╰──────────╯

    "folke/twilight.nvim",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    -- ╭─────────╮
    -- │ zenmode │
    -- ╰─────────╯
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    -- ╭───────────────╮
    -- │ vim-maximizer │
    -- ╰───────────────╯
    {
        "szw/vim-maximizer",
        keys = {
            { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
        },
    },

    -- ╭─────────╮
    -- │ mini.ai │
    -- ╰─────────╯
    {
        "echasnovski/mini.ai",
    },

    -- ╭──────────╮
    -- │ floaterm │
    -- ╰──────────╯
    {
        "voldikss/vim-floaterm",
    },

    -- ╭─────────────╮
    -- │ comment box │
    -- ╰─────────────╯
    {
        "LudoPinelli/comment-box.nvim",
    },

    -- ╭──────────────╮
    -- │ bad-practice │
    -- ╰──────────────╯
    {
        "antonk52/bad-practices.nvim",
    },

    -- ╭────────────╮
    -- │ cd-project │
    -- ╰────────────╯

    {

        "LintaoAmons/cd-project.nvim",
    },

    -- ╭──────────╮
    -- │ cellular │
    -- ╰──────────╯
    {
        "eandrju/cellular-automaton.nvim",
    },

    -- ╭───────────╮
    -- │ centerpad │
    -- ╰───────────╯
    {
        "smithbm2316/centerpad.nvim",
    },

    -- ╭───────────────╮
    -- │ editor config │
    -- ╰───────────────╯
    {
        "editorconfig/editorconfig-vim",
    },
}

