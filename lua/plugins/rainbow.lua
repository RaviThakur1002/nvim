return {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" }, -- Lazy loads the plugin when you open a file
    config = function()
        local rainbow_delimiters = require('rainbow-delimiters')

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'], -- Highlight the whole file
            },
            query = {
                [''] = 'rainbow-delimiters', -- Default query for most languages
            },
        }
    end
}

