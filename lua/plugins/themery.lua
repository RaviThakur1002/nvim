-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"everforest",
				"nord",

			},
			livePreview = true,
		})
	end,
}
