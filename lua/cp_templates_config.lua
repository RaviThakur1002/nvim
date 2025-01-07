-- File: ~/.config/nvim/lua/cp_templates_config.lua
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

local function insert_template(template_path)
    local content = vim.fn.readfile(vim.fn.expand(template_path))
    vim.api.nvim_put(content, "l", true, true)
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
                        insert_template(selection.value)
                    end)
                    return true
                end,
            })
            :find()
    else
        vim.ui.select(template_names, select_opts, function(choice)
            if choice then
                insert_template(template_paths[choice])
            end
        end)
    end
end

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

return M
