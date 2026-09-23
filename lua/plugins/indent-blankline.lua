return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local highlight = {
			"RainbowRed",
            "RainbowWhite",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ff3344" })
			vim.api.nvim_set_hl(0, "RainbowWhite", { fg = "#e6e6e6" })
		end)

		vim.g.rainbow_delimiters = { highlight = highlight }

		require("ibl").setup({
			scope = { highlight = highlight , enabled = true , show_start = true} ,
			indent = {char = "▎"}
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
