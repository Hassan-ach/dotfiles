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
					"pyright",
					"clangd",
					"yamlls",
					"jsonls",
					"marksman",
					"texlab",
					"intelephense",
					"tinymist",
					"lemminx",
					"postgres_lsp",
				},
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion = {
				completionItem = { snippetSupport = true },
			}

			local function on_attach_inlay_hints(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end

			local lsp = vim.lsp

			-- Core language servers
			local servers = {
				"postgres_lsp",
				"tinymist",
				"lemminx",
				"rust_analyzer",
				"intelephense",
				"texlab",
				"bashls",
				"lua_ls",
				"jsonls",
				"gopls",
				"cssls",
				"yamlls",
				"html",
				"tailwindcss",
				"ts_ls",
				"clangd",
				"jdtls",
				"pyright",
				"marksman",
			}

			for _, server in ipairs(servers) do
				local opts = { capabilities = capabilities, on_attach = on_attach_inlay_hints }

				if server == "sqls" then
					opts.settings = {
						sqls = {
							connections = {
								{
									driver = "postgresql",
									dataSourceName = "host=localhost port=5432 user=admin password=admin123 dbname=mydb sslmode=disable",
								},
							},
						},
					}
				elseif server == "lua_ls" then
					opts.settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							telemetry = { enable = false },
						},
					}
				elseif server == "gopls" then
					opts.settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					}
				elseif server == "yamlls" then
					opts.settings = {
						yaml = {
							schemas = {
								["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
								["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
								["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/application.json"] = "application*.yml",
							},
							validate = true,
							completion = true,
							hover = true,
						},
					}
				elseif server == "ts_ls" then
					opts.on_attach = function(client, bufnr)
						client.server_capabilities.documentFormattingProvider = false
						if client.server_capabilities.inlayHintProvider then
							vim.lsp.inlay_hint(bufnr, true)
						end
					end
					opts.init_options = { preferences = { disableSuggestions = true } }
					opts.settings =
						{ typescript = { preferences = { importModuleSpecifierPreference = "non-relative" } } }
				elseif server == "clangd" then
					opts.cmd = {
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
					}
					opts.filetypes = { "c", "cpp", "objc", "objcpp" }
					-- opts.root_dir = lspconfig.util.root_pattern("src")
					opts.init_options = {
						clangdFileStatus = true,
						fallbackFlags = { "-std=c++2a", "-I/home/bagi/git-clone-projects/raylib/src" },
					}
					opts.single_file_support = true
				elseif server == "html" then
					opts.filetypes = { "html", "jsp" }
					opts.init_options = {
						configurationSection = { "html", "css", "jsp" },
						embeddedLanguages = {
							css = true,
							javascript = true,
						},
					}
				end

				lsp.config(server, opts)
				lsp.enable(server)
			end

			-- Theme / highlight (example)
			vim.cmd("highlight LspInlayHint guifg=#5c6370 gui=italic")
		end,
	},
}
