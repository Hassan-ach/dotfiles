-- Autoclosing tags for HTML and JSX.
return {
	"windwp/nvim-ts-autotag",
	dependencies = { "nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			filetypes = {
				"html",
				"xml",
				"jsx",
				"tsx",
			},
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- -- Also override individual filetype configs, these take priority.
			-- -- Empty by default, useful if one of the "opts" global settings
			-- -- doesn't work well in a specific filetype
			-- per_filetype = {
			-- 	["js"] = {
			-- 		enable_close = false,
			-- 	},
			-- 	["ts"] = {
			-- 		enable_close = false,
			-- 	},
			-- 	["typescript"] = {
			-- 		enable_close = false,
			-- 	},
			-- 	["javascript"] = {
			-- 		enable_close = false,
			-- 	},
			-- },
		})
	end,
	-- not working, i don't now why
}
