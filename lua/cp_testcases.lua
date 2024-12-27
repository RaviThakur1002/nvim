-- ~/.config/nvim/lua/cp_testcases.lua
local M = {}

M.config = {
	telescope_config = {
		layout_config = {
			width = 0.2,
			height = 0.3,
		},
		layout_strategy = "center",
	},
}

-- Function to parse JSON file
function M.parse_json_file(file_path)
	local file = io.open(file_path, "r")
	if not file then
		vim.notify("test_cases.json not found in current directory", vim.log.levels.WARN)
		return nil
	end

	local content = file:read("*all")
	file:close()

	local ok, parsed = pcall(vim.fn.json_decode, content)
	if not ok then
		vim.notify("Failed to parse JSON file: invalid JSON", vim.log.levels.ERROR)
		return nil
	end
	return parsed
end

-- Function to get test cases
function M.get_test_cases()
	local json_path = vim.fn.getcwd() .. "/test_cases.json"
	local data = M.parse_json_file(json_path)

	if not data or not data.tests then
		return {}
	end

	return data.tests
end

-- Function to insert test case input at cursor
function M.insert_test_case(test_case)
	-- Clear the current buffer content
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

	-- Process input string
	local input = test_case.input:gsub("\\n", "\n")
	local lines = {}

	-- Split into lines and filter out empty ones at the end
	for line in input:gmatch("[^\n]+") do
		table.insert(lines, line)
	end

	-- Insert all lines at the beginning of the buffer
	vim.api.nvim_buf_set_lines(buf, 0, 0, false, lines)

	-- Move cursor to the beginning of the file
	vim.api.nvim_win_set_cursor(0, { 1, 0 })
end

function M.select_and_insert_test_case()
	local test_cases = M.get_test_cases()
	if #test_cases == 0 then
		vim.notify("No test cases found in test_cases.json", vim.log.levels.WARN)
		return
	end

	local entries = {}
	for _, test in ipairs(test_cases) do
		table.insert(entries, {
			id = test.id,
			input = test.input,
			output = test.output,
			display = string.format("Test Case %d", test.id),
		})
	end

	local has_telescope, telescope = pcall(require, "telescope")
	if has_telescope then
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values

		pickers
			.new(M.config.telescope_config, {
				prompt_title = "Test Cases",
				finder = finders.new_table({
					results = entries,
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry.display,
							ordinal = entry.display,
						}
					end,
				}),
				sorter = conf.generic_sorter({}),
				previewer = false,
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						M.insert_test_case(selection.value)
					end)
					return true
				end,
			})
			:find()
	else
		-- Fallback to vim.ui.select if Telescope is not available
		vim.ui.select(entries, {
			prompt = "Select Test Case:",
			format_item = function(item)
				return item.display
			end,
		}, function(choice)
			if choice then
				M.insert_test_case(choice)
			end
		end)
	end
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	vim.keymap.set("n", "<leader>tc", function()
		M.select_and_insert_test_case()
	end, {
		noremap = true,
		silent = true,
		desc = "Select test case",
	})
end

return M
