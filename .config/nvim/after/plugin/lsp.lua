local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")
lsp.ensure_installed({
    'ts_ls',
    'rust_analyzer',
    'eslint',
    'jdtls',

})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local jdtls_path = vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/bin/jdtls")
lsp.configure('jdtls', {
    cmd = {
        jdtls_path,
        "-configuration", vim.fn.expand("~/.cache/jdtls/config"),
        "-data", vim.fn.expand("~/.cache/jdtls/workspace"),
        "--jvm-arg=-javaagent:/path/to/lombok.jar"
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
})


-- Configure JDTLS
-- lsp.configure("jdtls", {
--     cmd = {
--         "jdtls",
--         "--jvm-arg=-javaagent:" .. vim.fn.expand("~/.local/share/jdtls/lombok.jar") -- Fix Lombok path
--     },
--     root_dir = function(fname)
--         return lspconfig.util.root_pattern("build.gradle", "pom.xml", ".git")(fname) -- Fix root detection
--     end,
-- })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
