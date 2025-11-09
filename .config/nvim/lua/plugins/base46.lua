return {
	{
		"nvchad/base46",
		config = function()
			require("nvchad")
		end,
	},
	{
		"nvchad/ui",
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
