local namespace = "plugins.lang."

local M = { "mason-org/mason.nvim", lazy = true }

M.keys = { { "<leader>ma", "<cmd>Mason<cr>", { desc = "Mason", mode = "n" } } }

M.dependencies = {
	{ "neovim/nvim-lspconfig", lazy = true },
	{ "L3MON4D3/LuaSnip", lazy = true },
	require(namespace .. "cmp"),
}

M.opts = {
	ui = {
		icons = {
			package_installed = "✓ ",
			package_pending = "➜ ",
			package_uninstalled = "✗ ",
		},
	},
}

return M
