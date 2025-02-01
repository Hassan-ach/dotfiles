vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- toggle comment
vim.keymap.set('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end,
    { noremap = true, silent = true })
vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { noremap = true, silent = true })

-- Disable Copilot's default tab key mapping
vim.g.copilot_no_tab_map = true

-- Keymaps for Copilot
vim.api.nvim_set_keymap("i", "<C-]>", 'copilot#Accept("<CR>")', { silent = true, expr = true }) -- Accept
vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Dismiss()', { silent = true, expr = true })     -- Dismiss
vim.api.nvim_set_keymap("i", "<M-]>", 'copilot#Next()', { silent = true, expr = true })         -- Next suggestion
vim.api.nvim_set_keymap("i", "<M-[>", 'copilot#Previous()', { silent = true, expr = true })     -- Previous suggestion

vim.keymap.set("n", "<leader>c", function()
    if vim.g.copilot_enabled == 1 then
        vim.g.copilot_enabled = 0
        print("Copilot Disabled")
    else
        vim.g.copilot_enabled = 1
        print("Copilot Enabled")
    end
end, { desc = "Toggle Copilot" })
