-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"nightfox",
				"duskfox",
				"tokyonight-night",
				"tokyonight-storm",
				"tokyonight-moon",
				"everforest",

			},
			livePreview = true,
		})
	end,
}
