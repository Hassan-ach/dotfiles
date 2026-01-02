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
						accept = false,
						refresh = "gr",
						open = "<M-CR>",
					},
				},
				filetypes = {
					["*"] = true,
				},
				suggestion = {

					keymap = {
						accept = false,
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		config = function()
			require("copilot_cmp").setup({
				filetypes = {
					["*"] = true,
				},
			})
		end,
		dependencies = { "zbirenbaum/copilot.lua" },
	},
}
