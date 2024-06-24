local M = {}

M.active = 'tokyonight'

M.colourschemes = {
	{
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
}

return M
