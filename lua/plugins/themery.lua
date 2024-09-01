-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"catppuccin-mocha",
				"tokyonight-moon",
				"tokyonight-night",
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
				"material-darker",
				"material-deep-ocean",
				"oxocarbon",
				"kanagawa-dragon",
				"kanagawa-wave",
				"boo",
				"minimal",
				"embark",
				"sunbather",
			},
			livePreview = true,
		})
	end,
}
