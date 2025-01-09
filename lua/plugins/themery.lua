-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"nightfox",
				"duskfox",
				"tokyonight-night",
				"tokyonight-moon",
				"everforest",
				"nordic",

			},
			livePreview = true,
		})
	end,
}
