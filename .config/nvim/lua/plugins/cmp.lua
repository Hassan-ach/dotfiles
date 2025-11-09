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
		local opts = {
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
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "copilot" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,

					-- Add this to prioritize LSP over Copilot
					function(entry1, entry2)
						local type_priority = {
							copilot = 1,
							nvim_lsp = 2,
							luasnip = 3,
							buffer = 4,
							path = 5,
						}
						local priority1 = type_priority[entry1:get_completion_item().source] or 6
						local priority2 = type_priority[entry2:get_completion_item().source] or 6
						if priority1 ~= priority2 then
							return priority1 < priority2
						end
					end,

					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			formatting = {
				format = function(entry, vim_item)
					-- Add icons or labels to distinguish sources
					if entry.source.name == "copilot" then
						vim_item.menu = "[Copilot]"
					elseif entry.source.name == "nvim_lsp" then
						vim_item.menu = "[LSP]"
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
		opts = vim.tbl_deep_extend("force", opts, require("nvchad.cmp"))
		cmp.setup(opts)
	end,
}
