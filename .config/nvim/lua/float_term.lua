local M = {}

---@class TerminalState
---@field buf integer
---@field win integer
---@field cmd? string

---@type table<string, TerminalState>
local terminals = {}

---@class FloatTermOpts
---@field cmd? string|string[]
---@field size? {width: number, height: number}
---@field width? number
---@field height? number
---@field border? string
---@field persistent? boolean
---@field cwd? string
---@field env? table<string, string>
---@field on_exit? function
---@field ft? string

---@param opts FloatTermOpts
---@return {buf: integer, win: integer}
local function create_window(opts)
	local columns = vim.o.columns
	local lines = vim.o.lines

	-- Handle size table or individual width/height
	local width = opts.size and opts.size.width or opts.width or 0.8
	local height = opts.size and opts.size.height or opts.height or 0.8

	-- Handle both absolute and relative sizes
	local w = width > 1 and width or math.floor(width * columns)
	local h = height > 1 and height or math.floor(height * lines)

	local col = math.floor((columns - w) / 2)
	local row = math.floor((lines - h) / 2)

	local buf = opts.buf
	if not buf or not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = w,
		height = h,
		col = col,
		row = row,
		style = "minimal",
		border = opts.border or "rounded",
	})

	return { buf = buf, win = win }
end

---@param cmd? string|string[]
---@param opts? FloatTermOpts
function M.float_term(cmd, opts)
	opts = opts or {}
	local key = cmd or "default"

	local term = terminals[key]

	-- If window exists and is valid, toggle it
	if term and vim.api.nvim_win_is_valid(term.win) then
		vim.api.nvim_win_hide(term.win)
		return
	end

	-- Reuse buffer if it exists and matches the command
	local buf = term and vim.api.nvim_buf_is_valid(term.buf) and term.buf or nil

	-- Create window
	local result = create_window(vim.tbl_extend("force", opts, { buf = buf }))

	-- Initialize terminal if needed
	if not buf or vim.bo[result.buf].buftype ~= "terminal" then
		vim.api.nvim_set_current_buf(result.buf)

		-- Set filetype if provided
		if opts.ft then
			vim.bo[result.buf].filetype = opts.ft
		end

		local term_cmd = cmd
		if type(cmd) == "table" then
			term_cmd = table.concat(cmd, " ")
		end

		-- Change directory if cwd is provided
		local original_cwd = nil
		if opts.cwd then
			original_cwd = vim.fn.getcwd()
			vim.cmd("lcd " .. vim.fn.fnameescape(opts.cwd))
		end

		if term_cmd then
			vim.fn.termopen(term_cmd, {
				env = opts.env,
				on_exit = function(_, exit_code)
					-- Restore original directory
					if original_cwd then
						pcall(vim.cmd, "lcd " .. vim.fn.fnameescape(original_cwd))
					end

					if opts.on_exit then
						opts.on_exit(exit_code)
					end

					-- Clean up if not persistent
					if not opts.persistent then
						terminals[key] = nil
						if vim.api.nvim_buf_is_valid(result.buf) then
							vim.api.nvim_buf_delete(result.buf, { force = true })
						end
					end
				end,
			})
		else
			vim.cmd.term()
		end

		vim.cmd.startinsert()
	else
		-- Buffer exists, just enter insert mode
		vim.cmd.startinsert()
	end

	-- Store state
	terminals[key] = {
		buf = result.buf,
		win = result.win,
		cmd = cmd,
	}

	-- Auto-enter insert mode when switching to terminal window
	vim.api.nvim_create_autocmd("BufEnter", {
		buffer = result.buf,
		callback = function()
			vim.cmd.startinsert()
		end,
	})

	-- Clean up on buffer delete
	vim.api.nvim_create_autocmd("BufDelete", {
		buffer = result.buf,
		once = true,
		callback = function()
			terminals[key] = nil
		end,
	})
end

-- Alias for consistency
M.toggle = M.float_term

-- Keymaps

return M
