local namespace = "plugins.lang."

local M = { "mason-org/mason.nvim" }

M.event = { "BufNewfile", "BufReadPre" }
M.keys = { { "<leader>ma", "<cmd>Mason<cr>", { desc = "Mason", mode = "n" } } }

M.lazy = true
M.dependencies = {
	{ "mason-org/mason-lspconfig.nvim", lazy = true },
	{ "neovim/nvim-lspconfig", lazy = true },
	{ "L3MON4D3/LuaSnip", lazy = true },
	require(namespace .. "cmp"),
}

M.config = function()
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

	vim.lsp.config("*", {
		capabilities = lsp_capabilities,
	})

	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = {
						"vim",
						"require",
					},
				},
			},
		},
	})

	vim.lsp.config("bashls", {
		cmd = { "bash-language-server", "start" },
		filetypes = { "sh", "bash", "zsh" },
	})

	vim.lsp.config("html", {
		filetypes = { "html", "gotmpl" },
	})

	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓ ",
				package_pending = "➜ ",
				package_uninstalled = "✗ ",
			},
		},
	})
	require("mason-lspconfig").setup({
		-- A list of servers to automatically install if they're not already
		-- installed. Example: { "rust_analyzer@nightly", "lua_ls" }
		---@type string[]
		ensure_installed = {
			"lua_ls",
			"bashls",
			"gopls",
			"clangd",
			"ts_ls",
			"html",
		},

		-- Whether installed servers should automatically be enabled via
		-- `:h vim.lsp.enable()`.
		--
		-- To exclude certain servers from being automatically enabled:
		-- ```lua
		--   automatic_enable = {
		--     exclude = { "rust_analyzer", "ts_ls" }
		--   }
		-- ```
		--
		-- To only enable certain servers to be automatically enabled:
		-- ```lua
		--   automatic_enable = {
		--     "lua_ls",
		--     "vimls"
		--   }
		-- ```
		---@type boolean | string[] | { exclude: string[] }
		automatic_enable = true,
	})
end

return M
