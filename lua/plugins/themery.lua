-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"catppuccin-mocha",
				"duskfox",
				"palette",
				"rose-pine-moon",
				"rose-pine-main",
				"minimal",
				"embark",
			},
			livePreview = true,
		})
	end,
}
