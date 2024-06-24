local M = {}

local colourschemes = require('colour.colourscheme')

vim.api.nvim_create_augroup('ColoursGroup', {})
vim.api.nvim_create_autocmd('UIEnter', {
	group = 'ColoursGroup',
	callback = function()
		vim.cmd.colorscheme(colourschemes.active)
	end,
})

M = colourschemes.colourschemes

return M
