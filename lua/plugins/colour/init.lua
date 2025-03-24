local util = require("core.util")

local active_colourscheme = "tokyonight"
local namespace = "plugins.colour."
local plugins = {
	"tokyonight",
	"lualine",
	"treesitter",
	"rainbow-csv",
}

vim.api.nvim_create_augroup("ColoursGroup", {})
vim.api.nvim_create_autocmd("UIEnter", {
	group = "ColoursGroup",
	callback = function()
		vim.cmd.colorscheme(active_colourscheme)
	end,
})

local M = util.get_deps(namespace, plugins)

return M
