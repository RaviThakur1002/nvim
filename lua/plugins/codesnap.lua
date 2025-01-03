return {
	"mistricky/codesnap.nvim",
	build = "make",

	config = function()
		require("codesnap").setup({
			title = "Devil003",
			code_font_family = "CaskaydiaCove Nerd Font",
			watermark_font_family = "CaskaydiaCove Nerd Font",
			watermark = "Devil003", --water mark only works when padding is more like 122 or something
			bg_theme = "bamboo",
			breadcrumbs_separator = "/",
			has_breadcrumbs = false,
			has_line_number = false,
			show_workspace = false,
			min_width = 0,
			bg_x_padding = 50,
			bg_y_padding = 50,
			save_path = "~/Pictures/Screenshots/",
		})
	end,
}
