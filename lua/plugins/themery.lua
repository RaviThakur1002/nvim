-- lua/plugins/themery.lua
return {
    "zaldih/themery.nvim",
    config = function()
        require("themery").setup({
            themes = {
                "catppuccin-mocha",
                "tokyonight-moon",
                "tokyonight-night",
                "duskfox",
                "dracula",
                "rose-pine-moon",
                "rose-pine-main",
                "material-darker",
                "material-deep-ocean",
                "material-palenight",
            },
            
            livePreview = true,
        })
    end,
}
