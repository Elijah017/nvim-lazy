local M = { "nvimdev/dashboard-nvim", lazy = true }

M.event = "VimEnter"

M.dependencies = {
	"nvim-tree/nvim-web-devicons",
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}

M.config = function()
	require("dashboard").setup({
		theme = "hyper",
		shortcut_type = "number",
		config = {
			-- header = require('ascii').get_random_global(),
			header = require("ascii").art.text.neovim.delta_corps_priest1,
			-- header = require('ascii').art.text.neovim.bloody,
			week_header = { enable = false },
			shortcut = {
				{
					desc = "󰊳 Update",
					group = "@property",
					action = "Lazy update",
					key = "u",
				},
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Files",
					group = "Label",
					action = "Telescope find_files",
					key = "s",
				},
				{
					icon = "󰿅 ",
					desc = "Quit",
					group = "Number",
					action = "quit",
					key = "q",
				},
			},
			packages = { enable = true },
			project = {
				enable = false,
				limit = 4,
				icon = "󰉖 ",
				label = "Directories",
				action = "Telescope find_files cwd=",
			},
			mru = {
				limit = 8,
				icon = " ",
				label = "Recent Files",
				cwd_only = false,
			},
			footer = {},
		},
	})
end

return M
