local M = {}

-- =============================================================================
-- TRANSPARENCY FUNCTIONS
-- =============================================================================

-- Function to remove background from all main UI elements
-- This makes Neovim inherit the terminal's background
function M.remove_background()
	-- Main editor areas - the core editing interface
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" }) -- Main editor background
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" }) -- Non-current windows
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" }) -- Git signs, diagnostics column
	vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" }) -- Line numbers
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" }) -- Current line number
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#404040", fg = "#ffffff" }) -- Current line highlight
	vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" }) -- Vertical split separator (legacy)
	vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" }) -- Window separator (modern)
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" }) -- ~ symbols at end of buffer
	vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" }) -- Folded text background
	vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE" }) -- Fold indicator column

	-- Status and tab areas
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" }) -- Active statusline
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" }) -- Inactive statusline
	vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" }) -- Inactive tabs
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" }) -- Tab line fill area
	vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" }) -- Selected tab

	-- Miscellaneous UI elements
	vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" }) -- Characters that don't exist in file
	vim.api.nvim_set_hl(0, "SpecialKey", { bg = "NONE" }) -- Special characters (tabs, spaces)
	vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" }) -- Message/command area
end

-- Function to make popup windows transparent
-- This affects floating windows, completion menus, etc.
function M.set_popup_background()
	-- Completion menu styling
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" }) -- Popup menu background
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#404040", fg = "#ffffff" }) -- Selected completion item
	vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" }) -- Popup scrollbar background
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" }) -- Popup scrollbar thumb

	-- Floating windows (LSP hover, diagnostics, etc.)
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" }) -- Floating window background
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" }) -- Floating window border
	vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" }) -- Floating window title

	-- Command line completion
	vim.api.nvim_set_hl(0, "WildMenu", { bg = "NONE" }) -- Command completion menu

	-- Plugin-specific transparency (Telescope)
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
	-- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#404040", fg = "#ffffff" })

	-- Plugin-specific transparency (Which-key)
	vim.api.nvim_set_hl(0, "WhichKey", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#2a2a2a" })
	vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })

	-- Plugin-specific transparency (nvim-notify)
	vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = "NONE" })

	-- LSP signature help
	vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "NONE" })
end

-- Convenience function to apply full transparency
function M.apply_transparent_theme()
	M.remove_background()
	M.set_popup_background()
end

-- =============================================================================
-- THEME-SPECIFIC COLOR OVERRIDES
-- =============================================================================

-- Line number colors for vague theme
-- Uses muted colors that match vague's aesthetic
function M.vague_line_colors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#646477", bg = "NONE" }) -- Above current line
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#646477", bg = "NONE" }) -- Below current line
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8", bg = "NONE" }) -- Current line number
end

-- Line number colors for base16 themes (with solid background)
-- Uses a dark background to ensure readability
function M.base16_line_colors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8", bg = "#1e1e1e" })
end

-- Comprehensive overrides for black metal base16 themes
-- Provides better contrast and readability for the dark metal aesthetic
function M.black_metal_theme_overrides()
	-- Diagnostic colors - make errors more visible
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })

	-- Comment styling - make comments less prominent but readable
	vim.api.nvim_set_hl(0, "TSComment", { fg = "#555555", gui = nil })

	-- Selection and search highlighting - warm brown for contrast
	vim.api.nvim_set_hl(0, "Visual", { bg = "#9b8d7f", fg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "Search", { bg = "#9b8d7f", fg = "#1e1e1e" })

	-- Line numbers with solid backgrounds for consistency
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8", bg = "#1e1e1e" })
end

-- Custom lualine theme for vague colorscheme
-- Modifies iceberg_dark theme to work better with vague colors
function M.vague_status_colors()
	local custom_iceberg_dark = require("lualine.themes.iceberg_dark")

	-- Remove backgrounds to allow terminal transparency
	custom_iceberg_dark.normal.c.bg = nil -- Normal mode inactive sections
	custom_iceberg_dark.inactive.b.bg = nil -- Inactive window middle section
	custom_iceberg_dark.inactive.a.bg = nil -- Inactive window left section
	custom_iceberg_dark.inactive.c.bg = nil -- Inactive window right section

	-- Set mode-specific colors that complement vague theme
	custom_iceberg_dark.insert.a.bg = "#bc96b0" -- Insert mode - soft pink
	custom_iceberg_dark.visual.a.bg = "#787bab" -- Visual mode - muted purple
	custom_iceberg_dark.replace.a.bg = "#a1b3b9" -- Replace mode - soft blue

	-- Apply the custom theme
	require("lualine").setup({
		options = {
			theme = custom_iceberg_dark,
		},
	})
end

-- Reset lualine status colors
function M.rose_pine_status_colors()
	local custom_rose_pine = require("lualine-rose-pine")
	-- Remove backgrounds to allow terminal transparency
	custom_rose_pine.normal.c.bg = nil -- Normal mode inactive sections
	custom_rose_pine.visual.c.bg = nil -- Visual mode inactive sections
	custom_rose_pine.insert.c.bg = nil -- Insert mode inactive sections
	custom_rose_pine.inactive.b.bg = nil -- Inactive window middle section
	custom_rose_pine.inactive.a.bg = nil -- Inactive window left section
	custom_rose_pine.inactive.c.bg = nil -- Inactive window right section

	require("lualine").setup({
		options = {
			theme = custom_rose_pine,
		},
	})
end

-- =============================================================================
-- MAIN SETUP FUNCTION
-- =============================================================================

-- Sets up automatic colorscheme-specific overrides
-- This is called automatically when colorscheme changes
function M.setup_colorscheme_overrides()
	vim.api.nvim_create_autocmd("ColorScheme", {
		nested = true, -- Allow this autocmd to trigger other autocmds
		pattern = "*", -- Apply to all colorschemes
		callback = function()
			local colorscheme = vim.g.colors_name or ""

			-- Base16 theme handling
			if string.find(colorscheme, "base16") then
				-- Apply base16-specific line colors first
				M.base16_line_colors()

				-- Additional overrides for metal variants
				if string.find(colorscheme, "metal") then
					M.black_metal_theme_overrides()
				end

			-- Zenburn theme - just custom line colors
			elseif colorscheme == "zenburn" then
				M.base16_line_colors()

			-- Vague theme - transparency + custom colors + custom statusline
			elseif colorscheme == "vague" then
				M.apply_transparent_theme() -- Make background transparent
				M.vague_line_colors() -- Apply vague-specific line colors
				M.vague_status_colors() -- Apply vague-specific statusline

			-- Rose Pine theme - full transparency
			elseif colorscheme == "rose-pine" then
				M.apply_transparent_theme()
				M.rose_pine_status_colors()
				-- M.vague_status_colors()
			end
		end,
	})
end

-- =============================================================================
-- USER COMMANDS FOR MANUAL CONTROL
-- =============================================================================

-- Create user commands for manual theme adjustments
vim.api.nvim_create_user_command("MyLine", M.base16_line_colors, {
	desc = "Apply base16-style line number colors",
})

vim.api.nvim_create_user_command("VagueStatus", M.vague_status_colors, {
	desc = "Apply vague-themed statusline colors",
})

vim.api.nvim_create_user_command("VagueLine", M.vague_line_colors, {
	desc = "Apply vague-themed line number colors",
})

vim.api.nvim_create_user_command("TransparentTheme", M.apply_transparent_theme, {
	desc = "Make current theme transparent",
})

vim.api.nvim_create_user_command("Tr", M.apply_transparent_theme, {
	desc = "Quick command to make background transparent",
})

vim.api.nvim_create_user_command("NoTr", function()
	-- Force reload the current colorscheme to restore original backgrounds
	local current_colorscheme = vim.g.colors_name
	if current_colorscheme then
		vim.cmd("colorscheme " .. current_colorscheme)
		-- Force trigger the ColorScheme autocmd in case it doesn't fire
		vim.api.nvim_exec_autocmds("ColorScheme", { pattern = current_colorscheme })
	end
end, {
	desc = "Disable transparency and restore original theme backgrounds",
})

vim.api.nvim_create_user_command("DefStatus", function()
	require("lualine").setup({ options = { theme = "auto" } })
end, {
	desc = "Reset statusline to default auto theme",
})

return M
