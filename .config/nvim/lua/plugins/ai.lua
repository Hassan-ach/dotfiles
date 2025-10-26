return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				panel = {
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						-- accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		config = function()
			require("copilot_cmp").setup()
		end,
		dependencies = { "zbirenbaum/copilot.lua" },
	},
}
