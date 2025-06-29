-- local config = {
-- 	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
-- 	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
-- }
-- require("jdtls").start_or_attach(config)

-- In after/ftplugin/java.lua
local ok, jdtls = pcall(require, "jdtls")
if not ok then
	vim.notify("nvim-jdtls not available", vim.log.levels.ERROR)
	return
end

local config = {
	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
	root_dir = vim.fs.dirname(
		vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
	),
}
jdtls.start_or_attach(config)
