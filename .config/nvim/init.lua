local utils = require("utils")
-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- vim opts
require("vimopts")
-- lazy.nvim setup
require("lazy").setup("plugins", {
	defaults = {
		lazy = false,
	},
})

-- treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {
		"vimdoc",
		"go",
		"rust",
		"c",
		"lua",
		"python",
		"html",
		"css",
		-- "javascript",
		-- "typescript",
		"prisma",
		"haskell",
		-- "zig",
		-- "gleam",
		"wgsl",
		"php",
		"sql",
		"markdown",
		"java",
		"yaml",
		"properties",
		"json",
		"xml",
		"dockerfile",
	},
	-- sql being slow on large files :(
	highlight = {
		enable = true,
		disable = { "latex" },
	},
	indent = { enable = true },
	modules = {},
	sync_install = true,
	auto_install = true,
	autotag = { enable = true },
	ignore_install = {
		"latex",
	},
})

-- language specific mappings go here
require("mappings")

-- theme
vim.cmd("colorscheme base16-rose-pine-moon")
-- vim.cmd("colorscheme base16-black-metal-gorgoroth")
-- vim.api.nvim_set_hl(0, "Normal", { fg = "#c1c1c1", bg = "#121212" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#c1c1c1", bg = "#121212" })

utils.color_overrides.setup_colorscheme_overrides()
utils.dashboard.setup_dashboard_image_colors()
