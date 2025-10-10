return {
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim implicitly calls `setup {}`
		-- config = function(opts)
		-- 	require("typst-preview").setup(opts)
		-- end,
	},
}
