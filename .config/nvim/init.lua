local utils = require("utils")

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

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
		"prisma",
		"haskell",
		"wgsl",
		"php",
		"sql",
		"markdown",
		"markdown_inline",
		"java",
		"yaml",
		"properties",
		"json",
		"xml",
		"dockerfile",
		"latex",
		"norg",
		"scss",
		"svelte",
		"vue",
		"regex",
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
require("chadrc")

-- theme
-- utils.color_overrides.setup_colorscheme_overrides()
-- vim.cmd("colorscheme rose-pine")

-- (method 2, for non lazyloaders) to load all highlights at once
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end
-- os.execute("python3 ~/.config/nvim/pywal/chadwal.py &> /dev/null &")
--
local autocmd = vim.api.nvim_create_autocmd

autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = function()
		require("nvchad.utils").reload()
	end,
})
