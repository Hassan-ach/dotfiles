-- ================================
-- BASIC SETTINGS & GENERAL CONFIG
-- ================================
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set ts=2")
vim.cmd("set cmdheight=0")
vim.cmd("set termguicolors")
vim.cmd("set scrolloff=5")
vim.cmd("set signcolumn=no")
vim.o.scrolloff = 8
vim.opt.ignorecase = true

-- File handling and backup settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable netrw completely
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- Shell configuration
vim.cmd("set shell=/bin/zsh")
vim.cmd("set shellcmdflag=-c")
vim.cmd("set shellquote=")
vim.cmd("set shellxquote=")

-- Completion settings
vim.o.completeopt = "menuone,noselect,preview"

-- ================
-- TAB & INDENTATION
-- ================
-- Set tab width to 4 spaces
vim.opt.tabstop = 4 -- Width of a tab character
vim.opt.shiftwidth = 4 -- Number of spaces for auto-indentation
vim.opt.softtabstop = 4 -- Number of spaces for <Tab> and <BS> in insert mode
vim.opt.expandtab = true -- Convert tabs to spaces

-- Auto-indentation settings
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.smartindent = true -- Smart auto-indentation

-- ================
-- VISUAL SETTINGS
-- ================
-- Minor visual changes to panes
vim.opt.fillchars =
	{ vert = " ", horiz = " ", horizup = " ", horizdown = " ", vertleft = " ", vertright = " ", verthoriz = " " }

-- Cursor configuration
-- vim.cmd("set guicursor=n-v-c:block-blinkon1,i-ci:ver25")
vim.opt.guicursor = "n-v-c:block-blinkon1-CursorInsert,i:block-CursorInsert"

-- Stop right-shift when errors/warning appear
vim.o.signcolumn = "no"

-- ================
-- SPELL CHECKING
-- ================
vim.opt.spell = true
vim.opt.spelllang = { "en_us" } -- or {"en_us", "fr"} for multiple languages

-- ================
-- LEADER KEYS
-- ================
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ================
-- WINDOW NAVIGATION
-- ================
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ================
-- INSERT MODE MAPPINGS
-- ================
-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode " })
vim.keymap.set("i", "<C-[>", "<Esc>", { desc = "Exit insert mode " })

-- Autocomplete in normal text
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-n>", "<C-x><C-n>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<C-x><C-l>", { noremap = true, silent = true })

-- ================
-- VISUAL MODE MAPPINGS
-- ================
-- Move selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" }) -- Shift visual selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" }) -- Shift visual selected line Up

-- ================
-- NORMAL MODE MAPPINGS
-- ================
-- Scrolling with centering
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll forward full page and center" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll backward full page and center" })
vim.keymap.set("n", "Y", "yy", { desc = "Yank entire line" })

-- ================
-- CLIPBOARD OPERATIONS
-- ================
-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "yank to systeme clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "yank to systeme clipboard" })

-- ================
-- SPELL CHECK MAPPINGS
-- ================
vim.keymap.set("n", "<leader>ll", ":setlocal spell spelllang=en_us<CR>", { desc = "spell checker for EN" })

-- ================
-- LSP KEYMAPPINGS
-- ================
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go declaration" })
vim.keymap.set("n", "gr", function()
	-- Trigger the LSP references function and populate the quickfix list
	vim.lsp.buf.references()

	vim.defer_fn(function()
		-- Set up an autocmd to remap keys in the quickfix window
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "qf", -- Only apply this mapping in quickfix windows
			callback = function()
				-- Remap <Enter> to jump to the location and close the quickfix window
				vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>:cclose<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(0, "n", "q", ":cclose<CR>", { noremap = true, silent = true })

				-- Set up <Tab> to cycle through quickfix list entries
				vim.keymap.set("n", "<Tab>", function()
					local current_idx = vim.fn.getqflist({ idx = 0 }).idx
					local qflist = vim.fn.getqflist() -- Get the current quickfix list
					if current_idx >= #qflist then
						vim.cmd("cfirst")
						vim.cmd("wincmd p")
					else
						vim.cmd("cnext")
						vim.cmd("wincmd p")
					end
				end, { noremap = true, silent = true, buffer = 0 })

				vim.keymap.set("n", "<S-Tab>", function()
					local current_idx = vim.fn.getqflist({ idx = 0 }).idx
					if current_idx < 2 then
						vim.cmd("clast")
						vim.cmd("wincmd p")
					else
						vim.cmd("cprev")
						vim.cmd("wincmd p")
					end
				end, { noremap = true, silent = true, buffer = 0 })
			end,
		})
	end, 0)
end)

-- Code actions
-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

-- Error navigation and display
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "open float diagnostic" })
vim.keymap.set("n", "[e", vim.diagnostic.goto_next)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

-- ================
-- HARPOON KEYMAPPINGS
-- ================
vim.keymap.set("n", "<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle Harpoon quick menu" })
vim.keymap.set("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file to Harpoon" })

-- ================
-- FILE BROWSER MAPPINGS
-- ================
-- Colorscheme picker
vim.keymap.set("n", "<leader><space>", ":Telescope colorscheme<CR>")

-- Neo-tree setup
-- vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal right<CR>")

-- Oil.nvim setup
-- vim.keymap.set("n", "<leader>N", ":Oil<CR>")
-- vim.keymap.set("n", "<leader>n", ':lua require("oil").toggle_float()<CR>')

-- ================
-- LSP CONFIGURATION
-- ================
vim.lsp.set_log_level("warn")

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true, -- inline error messages
	signs = true, -- gutter signs
	underline = true, -- underline error lines
	update_in_insert = false, -- only show after leaving insert mode
	severity_sort = true,
})

-- ================
-- PLUGIN SETTINGS
-- ================
-- Zig formatter
-- vim.g.zig_fmt_autosave = 0

-- LuaSnip configuration
-- vim.g.use_precompiled_parsers = true

-- Python env
vim.g.python3_host_prog = os.getenv("HOME") .. "/.venv/nvim-python/bin/python"

-- ================
-- CUSTOM FUNCTIONS
-- ================
function leave_snippet()
	if
		((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
		and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
		and not require("luasnip").session.jump_active
	then
		require("luasnip").unlink_current()
	end
end

-- Colorscheme function
function C(arg)
	arg = arg or "default"
	if arg == "rust" then
		vim.cmd("colorscheme base16-gruvbox-material-dark-hard")
	elseif arg == "md" then
		vim.cmd("colorscheme vagun")
	else
		vim.cmd("Telescope colorscheme")
	end
end

-- Obsidian integration
-- function OpenInObsidian()
-- 	local file = vim.fn.expand("<cfile>") -- Get the file path under the cursor
-- 	if file:match("%.md$") then
-- 		local vault = "notes" -- Replace with your Obsidian vault name
-- 		local vault_path = vim.fn.expand("~/path/to/vault/") -- Adjust to your vault path
-- 		local relative_path = file:gsub(vault_path, "") -- Get relative path from vault root
-- 		local obsidian_url = "obsidian://open?vault=" .. vault .. "&file=" .. vim.fn.fnameescape(relative_path)
-- 		vim.fn.system({ "open", obsidian_url }) -- macOS 'open' command to launch Obsidian
-- 	else
-- 		vim.cmd("silent open " .. file) -- Default behavior (for non-.md files)
-- 	end
-- end

-- ================
-- USER COMMANDS
-- ================
vim.api.nvim_create_user_command("Setwd", function()
	vim.cmd("cd " .. vim.fn.expand("%:p:h"))
end, {})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	vim.g.disable_autoformat = true
end, {
	desc = "Disable autoformat-on-save",
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- ================
-- AUTOCOMMANDS
-- ================
-- Open Telescope when starting nvim with a directory
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			require("telescope.builtin").find_files()
		end
	end,
})
-- File type specific settings
vim.cmd([[
  autocmd BufNewFile,BufRead *.blade.php set filetype=blade
]])

-- SQL indentation
-- vim.cmd("autocmd FileType sql setlocal noautoindent")
-- vim.cmd("autocmd FileType sql setlocal nosmartindent")
-- vim.cmd("autocmd FileType sql setlocal nocindent")

-- Snippet management
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])

-- Help and man pages positioning
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	command = "wincmd H",
})

-- Diagnostic location list
vim.cmd([[
autocmd! DiagnosticChanged * lua vim.diagnostic.setloclist({open = false}) ]])

-- Directory creation on save
vim.api.nvim_create_augroup("CreateDirs", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "CreateDirs",
	pattern = "*",
	callback = function()
		local file_path = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(file_path) == 0 then
			vim.fn.mkdir(file_path, "p")
		end
	end,
})

-- Markdown settings
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md" },
	callback = function()
		vim.cmd("set linebreak")
		-- vim.cmd("colorscheme zenburn")
	end,
	nested = true,
})

-- Markdown file type settings
-- vim.api.nvim_create_autocmd({ "FileType", "VimEnter", "BufReadPre" }, {
-- 	pattern = { "*.md" },
-- 	callback = function()
-- 		vim.schedule(function()
-- 			vim.keymap.set("n", "<space>md", ":lua OpenInObsidian()<CR>", { noremap = true, silent = true })
-- 			vim.o.shiftwidth = 2
-- 		end)
-- 	end,
-- })

-- Markdown color scheme
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	pattern = { "*.md" },
-- 	callback = function()
-- 		vim.cmd("colorscheme base16-black-metal-gorgoroth")
-- 	end,
-- 	nested = true,
-- })

-- CSV file handling
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.csv" },
	callback = function()
		vim.cmd("CsvViewEnable")
	end,
})

-- Spell checking for text files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

-- Auto-formatting
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
-- 	callback = function()
-- 		vim.lsp.buf.format({ async = true })
-- 	end,
-- })
--

-- Make quickfix interactive
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		-- Only preview in quickfix window
		vim.api.nvim_buf_set_option(0, "cursorline", true) -- highlight current line
	end,
})

-- Inlay hints
vim.keymap.set("n", "<leader>ih", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "Toggle Inlay Hints" })
