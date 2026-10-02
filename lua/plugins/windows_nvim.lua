return {
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			require("windows").setup()
		end,
	},
	-- colorful winsep
	{
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			require("colorful-winsep").setup({
				symbols = { "─", "│", "┌", "┐", "└", "┘" },
				colors = { "#E67E80" }, })
		end,
		event = { "WinLeave" },
	},
}
