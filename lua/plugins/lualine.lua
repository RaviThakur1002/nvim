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
			git_color_1 = "#E9FF97",
			git_color_2 = "#FFD18E",
			git_color_3 = "#FFA38F",
			git_color_4 = "#FF7EE2",
			git_color_5 = "#36BA98",
			git_color_6 = "#E9C46A",
			git_color_7 = "#F4A261",
			git_color_8 = "#E76F51",
		}
		local bubbles_theme = {
			normal = {
				a = { fg = colors.pale_purple, bg = colors.light_purple },
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
							local git_colors = {
								colors.git_color_1,
								colors.git_color_2,
								colors.git_color_3,
								colors.git_color_4,
								colors.git_color_5,
								colors.git_color_6,
								colors.git_color_7,
								colors.git_color_8,
							}
							return { bg = git_colors[vim.fn.mode():byte() % #git_colors + 1], fg = colors.deep_purple }
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

