-- ~/.config/nvim/lua/plugins/themery.lua
return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"material-deep-ocean",
				"material-oceanic"

			},
			livePreview = true,
		})
	end,
}
