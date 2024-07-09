return {
	"folke/styler.nvim",
	config = function()
		require("styler").setup({
			themes = {
				-- Specific themes for different file types
				markdown = { colorscheme = "tokyonight-moon" },
				javascript = { colorscheme = "rose-pine-main" },
				javascriptreact = { colorscheme = "duskfox" },
				css ={ colorscheme = "material-deep-ocean" },
				text = { colorscheme = "dracula" },
			},
		})
	end,
}
