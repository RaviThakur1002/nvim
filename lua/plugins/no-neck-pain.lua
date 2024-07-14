return {
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        config = function()
            require("no-neck-pain").setup({
                width = 80,  -- Set the width of the centered window
                buffers = {
                    right = {
                        enabled = true,  -- Enable the right buffer
                        width = 30,  -- Set the width of the right buffer
                    },
                    left = {
                        enabled = true,  -- Enable the left buffer
                        width = 30,  -- Set the width of the left buffer
                    },
                },
            })
        end,
    },
}


