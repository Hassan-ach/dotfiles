return {
	{
		"folke/snacks.nvim",
		dependencies = {
			--	"folke/which-key.nvim",
			-- config = true, -- Add basic config for which-key
		},
		priority = 1000,
		lazy = false, -- Correctly set to load immediately
		opts = {
			-- Enabled modules
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			notifier = { enabled = true },
			dim = { enabled = true },
			styles = {
				notification = {
					wo = { wrap = true },
				},
			},
			image = {
				enabled = true,
				kitty_protocol = true,
				magick = {
					convert = "magick",
					identify = "magick identify",
				},
			},
		},
		config = function(_, opts)
			require("snacks").setup(opts)
			vim.keymap.set("n", "<leader>dd", function()
				require("snacks").dim.disable()
			end, { desc = "Disable dim" })
			vim.keymap.set("n", "<leader>de", function()
				require("snacks").dim.enable()
			end, { desc = "Enable dim" })
		end,
	},
}
