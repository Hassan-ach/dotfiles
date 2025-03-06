return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_imaps_enabled = 0
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            continuous = 1, -- Enable continuous compilation
            callback = 1,
            build_dir = "",
            options = {
                "-pdf",                           -- PDF output
                "-interaction=nonstopmode",       -- No interruption during compilation
                "-synctex=1",                     -- Sync PDF with source
            },
        }                                         -- vim.g.tex_conceal = "abdmg"
        vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
        vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull",
            "LaTeX Warning: .\\+ float specifier changed to",
            "Package hyperref Warning: Token not allowed in a PDF string" }
    end,
}
