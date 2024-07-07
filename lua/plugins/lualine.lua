return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local colors = {
            blue = "#80a0ff",
            cyan = "#79dac8",
            black = "#080808",
            white = "#c6c6c6",
            red = "#ff5189",
            violet = "#FF7EE2",
            grey = "#303030",
            orange = "#FF9A8A",
            green = "#FFD18E",
            yellow = "#E9FF97",
        }
        local bubbles_theme = {
            normal = {
                a = { fg = colors.black, bg = colors.violet },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white },
            },
            insert = {
                a = { fg = colors.black, bg = colors.blue },
            },
            visual = {
                a = { fg = colors.black, bg = colors.cyan },
            },
            replace = {
                a = { fg = colors.black, bg = colors.red },
            },
            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white },
            },
        }
        require("lualine").setup({
            options = {
                theme = bubbles_theme,
                component_separators = "",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    { "mode", separator = { left = "", right = "" }, right_padding = 2, left_padding = 2 },
                },
                lualine_b = {
                    { 
                        "filename",
                        separator = { right = "" },
                        color = { bg = colors.yellow, fg = colors.black },
                    },
                },
                lualine_c = {
                    {
                        "branch",
                        separator = { right = "" },
                        right_padding = 2,
                        left_padding = 2,
                        color = function()
                            local mode_color = {
                                n = colors.orange,
                                i = colors.cyan,
                                v = colors.violet,
                                ["␖"] = colors.violet,
                                V = colors.violet,
                                c = colors.red,
                                no = colors.orange,
                                s = colors.cyan,
                                S = colors.cyan,
                                ["␓"] = colors.cyan,
                                ic = colors.yellow,
                                R = colors.red,
                                Rv = colors.red,
                                cv = colors.red,
                                ce = colors.red,
                                r = colors.red,
                                rm = colors.red,
                                ["r?"] = colors.red,
                                ["!"] = colors.red,
                                t = colors.red,
                            }
                            return { bg = mode_color[vim.fn.mode()], fg = colors.black }
                        end,
                    },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    { 
                        "filetype", 
                        separator = { left = "" }, 
                        left_padding = 2, 
                        right_padding = 2,
                        color = { bg = colors.green, fg = colors.black },
                    },
                    { 
                        "progress", 
                        separator = { left = "" }, 
                        left_padding = 2, 
                        right_padding = 2,
                        color = { bg = colors.green, fg = colors.black },
                    },
                    { 
                        "location", 
                        separator = { left = "", right = "" }, 
                        left_padding = 2, 
                        right_padding = 2 
                    },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = {},
        })
    end,
}

