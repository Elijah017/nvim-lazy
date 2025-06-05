require("core.options")
require("core.set")
require("core.filetype")
require("core.autocmds")

-- Find and set the root directory of a project
-- requires core.options already configured
vim.g.root_dir = vim.fs.root(0, { ".git", ".nvim", ".prettierrc" })
if vim.g.root_dir then
	vim.g.root_set = true
else
	vim.g.root_dir = vim.fn.getcwd()
	vim.g.root_set = false
end
