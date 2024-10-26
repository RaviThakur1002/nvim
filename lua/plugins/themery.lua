-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"catppuccin-mocha",
				"duskfox",
				{
					name = "Dracula (Dark)",
					colorscheme = "dracula",
					before = [[
                    require("dracula-config")()
                    ]],
				},
				"palette",
				"rose-pine-moon",
				"rose-pine-main",
				"minimal",
				"embark",
				"calvera",
			},
			livePreview = true,
		})
	end,
}
