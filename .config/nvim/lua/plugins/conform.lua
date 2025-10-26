return {
	"stevearc/conform.nvim",
	config = function()
		vim.g.disable_autoformat = false
		require("conform").setup({
			-- quiet = true,                    -- Disable success notifications
			-- log_level = vim.log.levels.WARN, --Only show warnings/errors
			log_level = vim.log.levels.DEBUG,
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "lsp" },
				python = { "black" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				go = { "gofumpt", "golines", "goimports-reviser" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				haskell = { "ormolu" },
				yaml = { "yamlfmt" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "mdformat" },
				gleam = { "gleam" },
				asm = { "asmfmt" },
				css = { "prettier" },
				makefile = { "makefmt", "checkmake" },
				php = { "pint", "php_cs_fixer" }, -- Corrected PHP formatters
				bash = { "shfmt" },
				typst = { "typstyle", "prettypst" },
				sql = { "pgformatter", "sleek" },
				xml = { "lemminx", "prettier" },
				-- For filetypes without a formatter:
				["_"] = { "trim_whitespace", "trim_newlines" },
			},
			formatters = {
				clang_format_java = {
					command = "clang-format",
					args = {
						"--assume-filename=.java",
						"--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}",
					},
					stdin = true,
				},
				clang_format = {
					command = "clang-format",
					args = { "--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}" },
					stdin = true,
				},
				shfmt = {
					command = "shfmt",
					args = { "-i", "4", "-ci" }, -- Set indentation to 4 spaces
					stdin = true,
				},
				ruff_format = {
					command = "ruff",
					args = { "format", "--stdin-filename", "$FILENAME", "-" },
					stdin = true,
				},
				black = {
					command = "black",
					args = { "--line-length", "88", "--fast", "-S" }, -- `-S` disables string normalization
					stdin = true,
				},
				prettier = {
					command = "prettier",
					args = function(ctx)
						return {
							"--stdin-filepath",
							ctx.filename or vim.api.nvim_buf_get_name(0), -- Ensure a valid filepath is always passed
							"--tab-width",
							"4",
							"--use-tabs",
							"false",
						}
					end,
					stdin = true,
				},
				rustfmt = {
					command = "rustfmt",
					args = { "--edition", "2021", "--config", "hard_tabs=false", "--config", "tab_spaces=4" },
					stdin = true,
				},
				gofstylua = {
					command = "stylua",
					args = function(ctx)
						return {
							"--stdin-filepath",
							ctx.filename or vim.api.nvim_buf_get_name(0),
							"--indent-type",
							"Spaces",
							"--indent-width",
							"2",
						}
					end,
					stdin = true,
				},
				umpt = {
					command = "gofumpt",
					args = { "-extra" },
					stdin = true,
				},
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat then
					return
				end
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
			stop_after_first = true, -- Set this globally to stop after the first successful formatter
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				-- print("helllloo")
				local mode = vim.api.nvim_get_mode().mode
				if mode:match("i") then
					return -- Don't format while typing
				end
				if vim.g.disable_autoformat then
					return
				end
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
