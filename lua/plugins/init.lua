return {
	-- ╭───────────╮
	-- │ multiline │
	-- ╰───────────╯

	{
		"mg979/vim-visual-multi",
	},

	-- ╭───────╮
	-- │ muren │
	-- ╰───────╯

	{
		"AckslD/muren.nvim",
		config = true,
	},

	-- ╭────────────────╮
	-- │ nerd-commenter │
	-- ╰────────────────╯

	{
		"preservim/nerdcommenter",
	},

	-- ╭───────────────╮
	-- │ smooth Cursor │
	-- ╰───────────────╯
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup()
		end,
	},

	-- ╭──────────────╮
	-- │ surround     │
	-- ╰──────────────╯
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
	},

	-- ╭──────────╮
	-- │ twilight │
	-- ╰──────────╯

	"folke/twilight.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},

	-- ╭─────────╮
	-- │ zenmode │
	-- ╰─────────╯
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- ╭───────────────╮
	-- │ vim-maximizer │
	-- ╰───────────────╯
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},

	-- ╭─────────╮
	-- │ mini.ai │
	-- ╰─────────╯
	{
		"echasnovski/mini.ai",
	},

	-- ╭──────────╮
	-- │ floaterm │
	-- ╰──────────╯
	{
		"voldikss/vim-floaterm",
	},

	-- ╭─────────────╮
	-- │ comment box │
	-- ╰─────────────╯
	{
		"LudoPinelli/comment-box.nvim",
	},

	-- ╭────────────╮
	-- │ cd-project │
	-- ╰────────────╯

	{

		"LintaoAmons/cd-project.nvim",
	},

	-- ╭─────────────╮
	-- │ mini.colors │
	-- ╰─────────────╯

	{
		"echasnovski/mini.colors",
	},

	-- ╭────────────╮
	-- │ vim-notify │
	-- ╰────────────╯
{
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		local background_color
		if vim.api.nvim_get_hl then -- For newer versions of Neovim
			background_color = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
		else -- Fallback for older versions
			background_color = vim.api.nvim_get_hl_by_name("Normal", true).background
		end

		notify.setup({
			background_colour = background_color and string.format("#%06x", background_color) or "#000000",
		})
		vim.notify = notify
	end,
}

}
