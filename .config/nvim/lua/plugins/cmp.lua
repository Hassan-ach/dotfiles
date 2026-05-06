-- lua/plugins/cmp.lua
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load cmp sources
		require("cmp_nvim_lsp")
		require("cmp_buffer")
		require("cmp_path")
		require("cmp_luasnip")

		local opts = {
			-- completion = {
			-- 	completeopt = "menu,menuone,noinsert",
			-- },
			-- window = {
			-- 	completion = cmp.config.window.bordered(),
			-- 	documentation = cmp.config.window.bordered(),
			-- },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "copilot", priority = 100 },
				{ name = "nvim_lsp", priority = 90 },
				{ name = "luasnip", priority = 80 },
				{ name = "tailwindcss", priority = 60 },
				{ name = "buffer", priority = 50 },
				{ name = "path", priority = 40 },
			}),
			sorting = {
				-- priority_weight = 2,
				comparators = {
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
				},
			},
			formatting = {
				format = function(entry, vim_item)
					-- Add icons or labels to distinguish sources
					if entry.source.name == "nvim_lsp" then
						vim_item.menu = "[LSP]"
					elseif entry.source.name == "copilot" then
						vim_item.menu = "[Copilot]"
					elseif entry.source.name == "luasnip" then
						vim_item.menu = "[Snippet]"
					elseif entry.source.name == "buffer" then
						vim_item.menu = "[Buffer]"
					elseif entry.source.name == "path" then
						vim_item.menu = "[Path]"
					end
					return vim_item
				end,
			},
		}
		opts = vim.tbl_deep_extend("force", require("nvchad.cmp"), opts)

		cmp.setup(opts)
	end,
}
