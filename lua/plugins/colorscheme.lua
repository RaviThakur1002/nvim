return {

	-- ╭─────────────────────────────────────────────────────────╮
	-- │ catpuuccin colorscheme                                  │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │ nightfox colorscheme                                    │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		"EdenEast/nightfox.nvim",
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │ Rose-pine colorscheme                                   │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │ embark colorscheme                                      │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		"embark-theme/vim",
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │ minimal nvim                                            │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		"Yazeed1s/minimal.nvim",
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │ palette colorscheme                                     │
	-- ╰─────────────────────────────────────────────────────────╯

	{
		"roobert/palette.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("palette").setup({
				palettes = {
					main = "custom_main_palette",
					accent = "pastel",
					state = "pastel",
				},

				italics = true,
				transparent_background = false,

				custom_palettes = {
					main = {
						custom_main_palette = {
							color0 = "#191D33",
							color1 = "#1A1E39",
							color2 = "#383f5e",
							color3 = "#8491C3",
							color4 = "#8D739B",
							color5 = "#a7a9b7",
							color6 = "#bdbfc9",
							color7 = "#d3d4db",
							color8 = "#e9e9ed",
						},
					},
					accent = {},
					state = {},
				},
			})
		end,
	},

	-- ╭────────╮
	-- │ yorumi │
	-- ╰────────╯
	{
		"yorumicolors/yorumi.nvim",
	},

}
