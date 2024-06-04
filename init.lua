-- Initialize vim.opt as a Lua table
vim.opt = vim.opt or {}

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
