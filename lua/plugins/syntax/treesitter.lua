local M = { "nvim-treesitter/nvim-treesitter", lazy = true }

M.event = { "BufNewFile", "BufReadPost" }
M.cmd = { "TSUpdate" }

M.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"c",
			"cmake",
			"cpp",
			"lua",
			"bash",
			"markdown",
			"go",
			"python",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,
		auto_install = false,

		highlight = { enable = true },

		indent = { enable = false },

		incremental_selection = { enable = true },
	})

	vim.filetype.add({
		extension = { zsh = "zsh" },
		pattern = { [".zshrc"] = "zsh" },
	})
	vim.treesitter.language.register("bash", { "zsh", "bash", "sh" })
end

return M
