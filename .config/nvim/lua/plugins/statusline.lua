return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "",
				globalstatus = true, -- optional: single bottom line for all splits
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
						colored = true,
						update_in_insert = false,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						shorting_target = 40,
					},
				},
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_active_clients({ bufnr = 0 })
							if #clients == 0 then
								return ""
							end
							local names = {}
							for _, c in ipairs(clients) do
								table.insert(names, c.name)
							end
							return table.concat(names, "|")
						end,
						icon = " ",
					},
					{
						function()
							local ok, conform = pcall(require, "conform")
							if not ok then
								return ""
							end

							local formatters = conform.list_formatters(0)
							local names = {}
							for _, f in ipairs(formatters) do
								if f.available then
									table.insert(names, f.name)
								end
							end
							if #names > 0 then
								return " " .. table.concat(names, ",")
							else
								return ""
							end
						end,
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
