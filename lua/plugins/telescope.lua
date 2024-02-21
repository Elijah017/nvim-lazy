local _ret = {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim', lazy = false },
	},
}

_ret.keys = {
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files", mode = "n" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep", mode = "n" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers", mode = "n" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help", mode = "n" },
}

return _ret
