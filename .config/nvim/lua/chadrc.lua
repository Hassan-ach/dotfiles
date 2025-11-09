local M = {}

M.base46 = {
	theme = "matugen",
	transparency = true,
}

M.ui = {
	-- statusline = {
	-- 	theme = "vscode",
	-- },
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
	},
	tabufline = {
		enabled = false,
	},
	cmp = {
		icons_left = false, -- only for non-atom styles!
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		abbr_maxwidth = 60,
		-- for tailwind, css lsp etc
		format_colors = { lsp = true, icon = "󱓻" },
	},
	lsp = { signature = true },
	telescope = { style = "borderless" },
	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},
}

return M
