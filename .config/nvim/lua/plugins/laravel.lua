return {
	"adalessa/laravel.nvim",
	dependencies = {
		"tpope/vim-dotenv",
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"kevinhwang91/promise-async",
		"nvim-neotest/nvim-nio",
	},
	cmd = { "Laravel" },
	keys = {
		{ "<leader>la", ":Laravel artisan<cr>", desc = "Laravel artisan" },
		{ "<leader>lr", ":Laravel routes<cr>", desc = "Laravel routes" },
		{ "<leader>lm", ":Laravel related<cr>", desc = "Laravel related" },
	},
	ft = { "php" },

	config = function(_, opts)
		local root = vim.fs.root(0, { "artisan", "composer.json" })

		if root then
			vim.cmd("lcd " .. vim.fn.fnameescape(root))
		end

		require("laravel").setup(opts)
	end,

	opts = {},
}
