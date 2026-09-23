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
		priority = 9000,
		config = function()
			local nvim_notify = require("notify")
			nvim_notify.setup({
				-- Animation style
				stages = "static",
				render = "compact",
				top_bottom = false,
				-- max_height = function()
				--   return math.floor(vim.o.lines * 0.85)
				-- end,
				-- max_width = function()
				--   return math.floor(vim.o.columns * 0.40)
				-- end,
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { zindex = 100 })
				end,
				timeout = 2500,
			})

			vim.notify = nvim_notify
		end,
	},

	-- ╭──────────────╮
	-- │ smear-cursor │
	-- ╰──────────────╯
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
}
