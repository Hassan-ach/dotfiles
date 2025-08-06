return {
	{
		"Wansmer/treesj",
		keys = { "<space>m", desc = "Toggle join trees" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local conds = require("nvim-autopairs.conds")

			npairs.setup()

			-- Autoclosing angle-brackets.
			npairs.add_rule(Rule("<", ">", {
				-- Avoid conflicts with nvim-ts-autotag.
				"-html",
				"-javascriptreact",
				"-typescriptreact",
			}):with_pair(conds.before_regex("%a+:?:?$", 3)):with_move(function(opts)
				return opts.char == ">"
			end))
		end,
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
	},
}
