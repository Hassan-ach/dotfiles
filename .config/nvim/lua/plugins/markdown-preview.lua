-- Markdown preview on the browser.
return {
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = "cd app && npm install",
		keys = {
			{
				"<leader>cp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
	},
}
