return {
    "stevearc/conform.nvim",
    config = function()
        vim.g.disable_autoformat = false
        require("conform").setup({
            -- quiet = true,                    -- Disable success notifications
            -- log_level = vim.log.levels.WARN, --Only show warnings/errors
            formatters_by_ft = {
                lua = { "stylua" },
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
                markdown = { "prettier" },
                gleam = { "gleam" },
                asm = { "asmfmt" },
                css = { "prettier" },
                php = { "pint", "php_cs_fixer" }, -- Corrected PHP formatters
                bash = { "shfmt" },
            },
            formatters = {
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
                black = {
                    command = "black",
                    args = { "--line-length", "88", "--fast", "-S" }, -- `-S` disables string normalization
                    stdin = true,
                },
                prettier = {
                    command = "prettier",
                    args = { "--tab-width", "4", "--use-tabs", "false" },
                    stdin = true,
                },
                rustfmt = {
                    command = "rustfmt",
                    args = { "--edition", "2021", "--config", "hard_tabs=false", "--config", "tab_spaces=4" },
                    stdin = true,
                },
                stylua = {
                    command = "stylua",
                    args = { "--indent-type", "Spaces", "--indent-width", "4" },
                    stdin = true,
                },
                gofumpt = {
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
                if vim.g.disable_autoformat then
                    return
                end
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}
