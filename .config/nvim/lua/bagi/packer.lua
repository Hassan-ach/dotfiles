-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use 'folke/tokyonight.nvim'
    use 'terrortylor/nvim-comment'
    use 'ThePrimeagen/vim-be-good'
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use 'windwp/nvim-ts-autotag'
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd("colorscheme tokyonight")
        end,
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    use("nvim-treesitter/playground")
    use("ThePrimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })
    use("folke/zen-mode.nvim")
    --use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")
    use("m4xshen/autoclose.nvim")
    use 'numToStr/Comment.nvim'
    use "pocco81/auto-save.nvim"
    use({
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'dracula'
                }
            })
        end
    })
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.keymap.set('n', '<C-t>', ':Neotree filesystem reveal left<CR>')
        end
    })
    use(
        {
            'stevearc/oil.nvim',
            opts = {},
            -- Optional dependencies
            requires = { { "echasnovski/mini.icons", opts = {} } },
            -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
            config = function()
                require("oil").setup({
                    view_options = {
                        show_hidden = true, -- Show hidden files
                    },
                })
                vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            end
        })

    use(
        {
            "preservim/tagbar",
            config = function()
                vim.g.tagbar_autoclose = 1
                vim.g.tagbar_ctags_bin = '/usr/local/bin/ctags'
                vim.keymap.set('n', '<leader>tg', ':TagbarOpen<CR>', {})
            end
        })
    use 'mg979/vim-visual-multi'
    use 'jwalton512/vim-blade'
end)
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
