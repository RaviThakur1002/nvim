-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"red_gray",
				"everforest",
			},
			livePreview = true,
		})
	end,
}
