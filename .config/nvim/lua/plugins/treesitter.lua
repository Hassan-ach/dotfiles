-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag", -- auto close tags
	},
}
