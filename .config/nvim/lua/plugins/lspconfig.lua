return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"lua_ls",
					"rust_analyzer",
					"gopls",
					"html",
					"cssls",
					"tailwindcss",
					"ts_ls",
					"pylsp",
					"clangd",
					"yamlls",
					"jsonls",
					"jdtls",
					"marksman",
					"texlab",
					"intelephense",
				},
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion = {
				completionItem = {
					snippetSupport = true,
				},
			}

			local lspconfig = require("lspconfig")

			-- lspconfig.jdtls.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize 'vim' as a global variable
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
							-- Spring Boot application.yml schema
							["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/application.json"] = "application*.yml",
						},
						validate = true,
						completion = true,
						hover = true,
					},
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"php",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})
			lspconfig.ts_ls.setup({
				on_attach = function(client, bufnr)
					-- Optional: disable formatting so you can use a separate formatter like Prettier
					client.server_capabilities.documentFormattingProvider = false
				end,
				capabilities = capabilities,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
				settings = {
					typescript = {
						preferences = {
							importModuleSpecifierPreference = "non-relative",
						},
					},
				},
			})

			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--background-index",
					"--pch-storage=memory",
					"--all-scopes-completion",
					"--pretty",
					"--header-insertion=never",
					"-j=4",
					"--inlay-hints",
					"--header-insertion-decorators",
					"--function-arg-placeholders",
					"--completion-style=detailed",
					-- "--std=c++20",
				},
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = require("lspconfig").util.root_pattern("src"),
				init_option = {
					clangdFileStatus = true,
					fallbackFlags = { "-std=c++2a", "-I/home/bagi/git-clone-projects/raylib/src" },
				},
				capabilities = vim.lsp.protocol.make_client_capabilities(),
				single_file_support = true,
			})

			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
		end,
	},
}
