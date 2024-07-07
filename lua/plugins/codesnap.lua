return {
	"mistricky/codesnap.nvim",
	build = "make",

	config = function()
		require("codesnap").setup({
			--has_breadcrumbs = true,
			watermark_font_family = "Source Code Pro",
			watermark = "devil003",
			bg_theme = "peach",
			bg_x_padding = 50,
			bg_y_padding = 50,
			save_path = "~/Pictures/Screenshots/",
		})
	end,
i}
