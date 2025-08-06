-- Cute code action floating window.
return {
	{
		"rachartier/tiny-code-action.nvim",
		event = "LspAttach",
		opts = {
			picker = {
				"buffer",
				opts = {
					hotkeys = true,
					-- Use numeric labels.
					hotkeys_mode = function(titles)
						return vim.iter(ipairs(titles))
							:map(function(i)
								return tostring(i)
							end)
							:totable()
					end,
					auto_preview = true, -- Enable or disable automatic preview
					auto_accept = false, -- Automatically accept the selected action
					position = "cursor", -- Position of the picker window
					winborder = "single", -- Border style for picker and preview windows
					custom_keys = {
						{ key = "m", pattern = "Fill match arms" },
						{ key = "r", pattern = "Rename.*" }, -- Lua pattern matching
					},
				},
			},
		},
	},
}
