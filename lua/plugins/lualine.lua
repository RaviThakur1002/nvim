return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Function to get highlight group colors
		local function get_hl_color(name, attr)
			local hl = vim.api.nvim_get_hl_by_name(name, true)
			if hl and hl[attr] then
				return string.format("#%06x", hl[attr])
			end
			return nil
		end

		-- Function to blend two colors
		local function blend_colors(c1, c2, ratio)
			local r1, g1, b1 = tonumber(c1:sub(2, 3), 16), tonumber(c1:sub(4, 5), 16), tonumber(c1:sub(6, 7), 16)
			local r2, g2, b2 = tonumber(c2:sub(2, 3), 16), tonumber(c2:sub(4, 5), 16), tonumber(c2:sub(6, 7), 16)
			local r = math.floor(r1 * (1 - ratio) + r2 * ratio)
			local g = math.floor(g1 * (1 - ratio) + g2 * ratio)
			local b = math.floor(b1 * (1 - ratio) + b2 * ratio)
			return string.format("#%02x%02x%02x", r, g, b)
		end

		local function get_theme_colors()
			local normal_bg = get_hl_color("Normal", "background") or "#1a1a1a"
			local normal_fg = get_hl_color("Normal", "foreground") or "#f0e0d0"
			local pmenu_bg = get_hl_color("Pmenu", "background") or blend_colors(normal_bg, normal_fg, 0.1)
			local pmenu_fg = get_hl_color("Pmenu", "foreground") or normal_fg
			local comment_fg = get_hl_color("Comment", "foreground") or blend_colors(normal_fg, normal_bg, 0.4)
			local string_fg = get_hl_color("String", "foreground") or "#a0c980"
			local keyword_fg = get_hl_color("Keyword", "foreground") or "#4d9375"
			local git_bg = get_hl_color("DiffAdd", "foreground") or "#a0c980"

			return {
				bg = normal_bg,
				fg = normal_fg,
				light_bg = pmenu_bg,
				light_fg = pmenu_fg,
				mid_bg = blend_colors(normal_bg, pmenu_bg, 0.5),
				comment = comment_fg,
				string = string_fg,
				keyword = keyword_fg,
				git = git_bg,
			}
		end

		local function get_mode_color()
			local mode_colors = {
				n = "keyword",
				i = "string",
				v = "pmenu",
				V = "pmenu",
				c = "comment",
				no = "comment",
				s = "string",
				S = "string",
				ic = "string",
				R = "pmenu",
				Rv = "pmenu",
				cv = "comment",
				ce = "comment",
				r = "pmenu",
				rm = "pmenu",
				t = "string",
			}
			local mode = vim.fn.mode()
			local theme_colors = get_theme_colors()
			return theme_colors[mode_colors[mode] or "keyword"]
		end

		local function get_bubbles_theme()
			local colors = get_theme_colors()
			return {
				normal = {
					a = { fg = colors.bg, bg = get_mode_color(), gui = "bold" },
					b = { fg = colors.fg, bg = colors.mid_bg },
					c = { fg = colors.comment, bg = colors.bg },
				},
				insert = { a = { fg = colors.bg, bg = colors.string, gui = "bold" } },
				visual = { a = { fg = colors.bg, bg = colors.pmenu, gui = "bold" } },
				replace = { a = { fg = colors.bg, bg = colors.keyword, gui = "bold" } },
				inactive = {
					a = { fg = colors.comment, bg = colors.bg },
					b = { fg = colors.comment, bg = colors.bg },
					c = { fg = colors.comment, bg = colors.bg },
				},
			}
		end

		require("lualine").setup({
			options = {
				theme = get_bubbles_theme,
				component_separators = "", -- No change in separators here
				section_separators = { left = "", right = "" }, -- Apply old separators
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" }, padding = { left = 2, right = 2 } },
				},
				lualine_b = {
					{
						"filename",
						separator = { right = "" }, -- Apply right separator here
						color = function()
							local colors = get_theme_colors()
							return { bg = colors.mid_bg, fg = colors.fg }
						end,
					},
				},
				lualine_c = {
					{
						"branch",
						separator = { right = "" }, -- Apply right separator here
						padding = { left = 2, right = 2 },
						color = function()
							local colors = get_theme_colors()
							return { bg = colors.git, fg = colors.bg }
						end,
					},
				},
				lualine_x = {},
				lualine_y = {
					{
						"filetype",
						separator = { left = "" }, -- Apply left separator here
						color = function()
							local colors = get_theme_colors()
							return { bg = colors.mid_bg, fg = colors.fg }
						end,
					},
				},
				lualine_z = {
					{
						"location",
						separator = { left = "", right = "" }, -- Apply left and right separators here
						padding = { left = 2, right = 2 },
						color = function()
							return { bg = get_mode_color(), fg = get_theme_colors().bg }
						end,
					},
				},
			},
			inactive_sections = {
				lualine_a = {
					{
						"filename",
						separator = { left = "", right = "" }, -- Apply left and right separators here
						padding = { left = 1, right = 1 },
						color = function()
							local colors = get_theme_colors()
							return { bg = colors.bg, fg = colors.comment }
						end,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})

		-- Set up an autocommand to update Lualine when the colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				require("lualine").setup()
			end,
		})
	end,
}
