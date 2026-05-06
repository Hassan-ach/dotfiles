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
					"templ",
					"htmx",
					"angularls",
					"pbls",
				},
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			if cmp_nvim_lsp_ok then
				capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			end

			local function on_attach_inlay_hints(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					--vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
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
				"templ",
				"htmx",
				"angularls",
				"dockerls",
				"pbls",
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
				elseif server == "htmx" then
					opts.filetypes = { "html", "templ" }
				elseif server == "templ" then
					opts.filetypes = { "go", "templ" }
				elseif server == "tailwindcss" then
					opts.cmd = { "tailwindcss-language-server", "--stdio" }
					opts.filetypes = {
						"html",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"vue",
						"svelte",
						"templ",
					}
					opts.filetypes.root_pattern = require("lspconfig.util").root_pattern("package.json", ".git")

					opts.settings = {
						tailwindCSS = {
							validate = true,
							lint = {
								cssConflict = "warning",
								invalidApply = "error",
								invalidConfigPath = "error",
								invalidScreen = "error",
								invalidTailwindDirective = "error",
								invalidVariant = "error",
								recommendedVariantOrder = "warning",
							},
							classAttributes = { "class", "className", "classList", "ngClass" },
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
							vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
						end
					end
					opts.init_options = { preferences = { disableSuggestions = true } }
					opts.settings =
						{ typescript = { preferences = { importModuleSpecifierPreference = "non-relative" } } }
					opts.filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
					opts.root_dir = vim.fs.root(0, { "package.json", ".git", "deno.json", "deno.jsonc" })
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
					opts.filetypes = {
						"html",
						-- "javascript",
						-- "typescript",
						"javascriptreact",
						"typescriptreact",
						"vue",
						"svelte",
						"templ",
						"jsp",
					}
					opts.init_options = {
						configurationSection = { "html", "css", "jsp", "templ" },
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
