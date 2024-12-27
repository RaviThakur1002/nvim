-- Initialize vim.opt as a Lua table
vim.opt = vim.opt or {}
vim.opt.sessionoptions:remove('folds')



-- Define CPTemplate command
--vim.cmd([[
  --command! -nargs=1 CPTemplate lua require('cp_templates').insert_template(<f-args>)
--]])

-- Define lazypath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazypath exists, if not, clone lazy.nvim from GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Prepend lazypath
vim.opt.rtp:prepend(lazypath)

-- Load plugins configuration
require("plugins")

-- Load vim options configuration
require("vim-options")

--Load keymaps configuration
require("keymaps")

-- ─────────────────── Load cp_templates configuration ───────────────────

--local cp_templates = require('cp_templates_config')

---- Define the command
--vim.api.nvim_create_user_command('CPTemplate', cp_templates.select_and_insert_template, {})
--
local cp_templates = require('cp_templates')

-- Setup the module (optional, if you want to change default config)
cp_templates.setup({
    -- Your custom config here
})

--cp_testcases config
require('cp_testcases').setup()

-- Define commands
vim.api.nvim_create_user_command('CPTemplate', function(opts)
    if opts.args ~= "" then
        cp_templates.insert_template(opts.args)
    else
        cp_templates.select_and_insert_template()
    end
end, {nargs = "?"})
--------------------------------------------------------------------------

-- Load lazy.nvim with plugins
require("lazy").setup({ { import = "plugins" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

--------------------------------------------------
