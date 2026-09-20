return {

	-- ╭──────────────╮
	-- │ Custom Theme │
	-- ╰──────────────╯
	{
		"LazyVim/LazyVim",
		optional = true,
		opts = {
			colorscheme = "red_gray",
		},
	},

	-- ╭────────────╮
	-- │ everforest │
	-- ╰────────────╯
	{
		"sainnhe/everforest",
	},

	{
		"catppuccin/nvim",
	},

	-- ╭─────────────────────────────────────────────────────────╮
	-- │ Local Loader                                            │
	-- │ Forces Neovim to initialize your local colors/ file     │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		"red_gray",
		dir = "~/.config/nvim/colors", 
		lazy = false,
		priority = 1000, -- Ensures it loads before everything else
		config = function()
			vim.cmd([[colorscheme red_gray]])
		end,
	},
}

