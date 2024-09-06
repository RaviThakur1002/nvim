return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Existing functions (get_hl_color, blend_colors, get_theme_colors) remain unchanged

		-- New function to determine if a color is light or dark
		local function is_light(color)
			local r, g, b = tonumber(color:sub(2, 3), 16), tonumber(color:sub(4, 5), 16), tonumber(color:sub(6, 7), 16)
			local brightness = (r * 299 + g * 587 + b * 114) / 1000
			return brightness > 155
		end

		-- Modified get_mode_color function
		local function get_mode_color()
			local mode_colors = {
				n = "keyword",
				i = "string",
				v = "visual",
				V = "visual",
				[""] = "visual",
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

		-- Modified get_bubbles_theme function
		local function get_bubbles_theme()
			local colors = get_theme_colors()
			local function mode_color(bg_color)
				return {
					fg = is_light(bg_color) and colors.bg or colors.fg,
					bg = bg_color,
					gui = "bold"
				}
			end

			return {
				normal = {
					a = mode_color(get_mode_color()),
					b = { fg = colors.fg, bg = colors.mid_bg },
					c = { fg = colors.comment, bg = colors.bg },
				},
				insert = { a = mode_color(colors.string) },
				visual = { a = mode_color(colors.visual) },
				replace = { a = mode_color(colors.keyword) },
				inactive = {
					a = { fg = colors.comment, bg = colors.bg },
					b = { fg = colors.comment, bg = colors.bg },
					c = { fg = colors.comment, bg = colors.bg },
				},
			}
		end

		-- The rest of the configuration remains the same
		require("lualine").setup({
			-- ... (keep the existing setup configuration)
		})

		-- Keep the autocommand for updating Lualine when the colorscheme changes
	end,
}
