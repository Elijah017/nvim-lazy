local M = {
	"folke/tokyonight.nvim",
	name = 'tokyonight',
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require('tokyonight').setup({
			style = 'night',
		})
	end,
}

return M
