return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			deep_purple = "#4A148C",
			purple = "#6A1B9A",
			medium_purple = "#8E24AA",
			light_purple = "#AB47BC",
			very_light_purple = "#CE93D8",
			pale_purple = "#E1BEE7",
			shaded_purple = "#da25c8",
		}
		local bubbles_theme = {
			normal = {
				a = { fg = colors.deep_purple, bg = colors.light_purple },
				b = { fg = colors.pale_purple, bg = colors.deep_purple },
				c = { fg = colors.pale_purple },
			},
			insert = {
				a = { fg = colors.pale_purple, bg = colors.purple },
			},
			visual = {
				a = { fg = colors.pale_purple, bg = colors.medium_purple },
			},
			replace = {
				a = { fg = colors.deep_purple, bg = colors.light_purple },
			},
			inactive = {
				a = { fg = colors.pale_purple, bg = colors.deep_purple },
				b = { fg = colors.pale_purple, bg = colors.deep_purple },
				c = { fg = colors.pale_purple },
			},
		}
		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" }, right_padding = 2, left_padding = 2 },
				},
				lualine_b = {
					{
						"filename",
						separator = { right = "" },
						color = { bg = colors.very_light_purple, fg = colors.deep_purple },
					},
				},
				lualine_c = {
					{
						"branch",
						separator = { right = "" },
						right_padding = 2,
						left_padding = 2,
						color = function()
							local mode_color = {
								n = colors.shaded_purple,
								i = colors.medium_purple,
								v = colors.light_purple,
								["␖"] = colors.light_purple,
								V = colors.light_purple,
								c = colors.shaded_purple,
								no = colors.shaded_purple,
								s = colors.medium_purple,
								S = colors.medium_purple,
								["␓"] = colors.medium_purple,
								ic = colors.very_light_purple,
								R = colors.light_purple,
								Rv = colors.light_purple,
								cv = colors.shaded_purple,
								ce = colors.shaded_purple,
								r = colors.shaded_purple,
								rm = colors.shaded_purple,
								["r?"] = colors.shaded_purple,
								["!"] = colors.shaded_purple,
								t = colors.shaded_purple,
							}
							return { bg = mode_color[vim.fn.mode()], fg = colors.deep_purple }
						end,
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"filetype",
						separator = { left = "" },
						left_padding = 2,
						right_padding = 2,
						color = { bg = colors.very_light_purple, fg = colors.deep_purple },
					},
					{
						"progress",
						separator = { left = "" },
						left_padding = 2,
						right_padding = 2,
						color = { bg = colors.very_light_purple, fg = colors.deep_purple },
					},
					{
						"location",
						separator = { left = "", right = "" },
						left_padding = 2,
						right_padding = 2,
					},
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
