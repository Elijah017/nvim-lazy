local M = { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", lazy = true }

M.keys = {
	{ "<leader>tf", "<cmd>Neotree reveal toggle<cr>", { desc = "Toggle file tree", mode = "n" } },
	{ "<leader>tg", "<cmd>Neotree source=git_status toggle<cr>", { desc = "Toggle file tree", mode = "n" } },
}

M.dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	"MunifTanjim/nui.nvim",
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		lazy = true,
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
	-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
}

M.config = function()
	require("neo-tree").setup({
		close_if_last_window = true,
	})

	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.INFO] = " ",
				[vim.diagnostic.severity.HINT] = "󰌵 ",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
				[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
				[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			},
		},
	})
end

return M
