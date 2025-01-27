-- File: ~/.config/nvim/lua/cp_templates.lua
local M = {}
M.config = {
    template_dir = vim.fn.expand("~/.config/nvim/cp_templates"),
    telescope_config = {
        layout_config = {
            width = 0.4,  -- Increased width to show longer paths
            height = 0.4,
        },
    },
}

local function scan_dir(directory)
    local templates = {}
    local scan_templates
    
    scan_templates = function(dir, prefix)
        prefix = prefix or ""
        local items = vim.fn.globpath(dir, "*", false, true)
        
        for _, item in ipairs(items) do
            local name = vim.fn.fnamemodify(item, ":t")
            local is_dir = vim.fn.isdirectory(item) == 1
            
            if is_dir then
                -- Recursively scan subdirectories
                scan_templates(item, prefix .. name .. "/")
            elseif name:match("%.templ$") then
                -- Store template with its relative path
                local template_name = prefix .. vim.fn.fnamemodify(name, ":r")
                templates[template_name] = item
            end
        end
    end
    
    scan_templates(directory)
    return templates
end

local function get_template_files()
    return scan_dir(M.config.template_dir)
end

M.insert_template = function(template_path)
    if vim.fn.filereadable(template_path) == 1 then
        local lines = vim.fn.readfile(template_path)
        local cursor_line = vim.fn.line('.')
        
        vim.api.nvim_put(lines, "l", true, false)
        
        -- Find the line number of "void solve()" function
        local solve_line = 0
        for i, line in ipairs(lines) do
            if line:match("void%s+solve%s*%(%) *{?") then
                solve_line = i
                break
            end
        end
        
        -- If "void solve()" is found, move the cursor to the line below it
        if solve_line > 0 then
            local new_line = cursor_line + solve_line + 1 -- +1 to move to the next line
            local last_line = vim.fn.line('$')
            if new_line <= last_line then
                vim.api.nvim_win_set_cursor(0, {new_line, 0})
                vim.cmd('normal! ^') -- Move to the first non-blank character of the line
                print("Template inserted. Cursor moved to 'void solve()'.")
            else
                print("Template inserted. 'void solve()' found but cursor not moved (beyond file end).")
            end
        else
            print("Template inserted: " .. vim.fn.fnamemodify(template_path, ":t:r"))
        end
    else
        print("Template not found: " .. template_path)
    end
end

function M.select_and_insert_template()
    local templates = get_template_files()
    local template_names = {}
    local template_paths = {}
    
    -- Convert templates map to sorted lists
    for name, path in pairs(templates) do
        table.insert(template_names, name)
        template_paths[name] = path
    end
    table.sort(template_names)

    local select_opts = {
        prompt = "Select a template:",
        format_item = function(item)
            return item
        end,
    }

    if pcall(require, "telescope") then
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values

        pickers
            .new(M.config.telescope_config, {
                prompt_title = "CP Templates",
                finder = finders.new_table({
                    results = template_names,
                    entry_maker = function(entry)
                        return {
                            value = template_paths[entry],
                            display = entry,
                            ordinal = entry,
                        }
                    end,
                }),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, map)
                    actions.select_default:replace(function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        M.insert_template(selection.value)
                    end)
                    return true
                end,
            })
            :find()
    else
        vim.ui.select(template_names, select_opts, function(choice)
            if choice then
                M.insert_template(template_paths[choice])
            end
        end)
    end
end

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

return M
