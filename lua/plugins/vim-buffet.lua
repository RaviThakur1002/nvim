return {
	{
		"bagrat/vim-buffet",
		dependencies = { "ryanoasis/vim-devicons" },
		event = "VeryLazy",
		config = function()
			-- Enable tabline always to see if it's working
			vim.o.showtabline = 2
			vim.g.buffet_powerline_separators = 1;
			vim.g.buffet_left_trunc_icon = ""
			vim.g.buffet_right_trunc_icon = ""
			vim.g.buffet_tab_icon = ""

			-- Buffer switching mappings
			for i = 1, 9 do
				vim.keymap.set(
					"n",
					string.format("<Leader>%d", i),
					string.format("<Plug>BuffetSwitch(%d)", i),
					{ silent = true }
				)
			end
			vim.keymap.set("n", "<Leader>0", "<Plug>BuffetSwitch(10)", { silent = true })

			-- Color configuration function
			local function set_buffet_colors()
				local bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg#")
				local fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg#")

				-- Fallback colors if unable to get from theme
				bg = bg ~= "" and bg or "#1a1a1a"
				fg = fg ~= "" and fg or "#f0e0d0"

				-- Simple highlight setup
				local highlights = {
					BuffetCurrentBuffer = { bg = fg, fg = bg, bold = true },
					BuffetActiveBuffer = { bg = bg, fg = fg },
					BuffetBuffer = { bg = bg, fg = fg },
					BuffetTab = { bg = bg, fg = fg },
					BuffetTrunc = { bg = bg, fg = fg },
				}

				-- Apply highlights
				for group, colors in pairs(highlights) do
					vim.api.nvim_set_hl(0, group, colors)
				end
			end

			-- Set initial colors
			set_buffet_colors()

			-- Update colors when colorscheme changes
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = set_buffet_colors,
			})
		end,
	},
}
