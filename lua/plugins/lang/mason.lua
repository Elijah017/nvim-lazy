local namespace = "plugins.lang."

---@type LazySpec
local M = { "williamboman/mason.nvim" }

M.event = { "BufNewfile", "BufReadPre" }
M.keys = { { "<leader>ma", "<cmd>Mason<cr>", { desc = "Mason", mode = "n" } } }

local nvim_opts = function(opts)
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	local config = {
		settings = {
			Lua = {
				-- Disable telemetry
				telemetry = { enable = false },
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					checkThirdParty = false,
					library = {
						-- Make the server aware of Neovim runtime files
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.stdpath("config") .. "/lua",
					},
				},
			},
		},
	}

	return vim.tbl_deep_extend("force", config, opts or {})
end

M.lazy = true
M.dependencies = {
	{ "williamboman/mason-lspconfig.nvim", lazy = true },
	{ "neovim/nvim-lspconfig", lazy = true },
	{ "L3MON4D3/LuaSnip", lazy = true },
	require(namespace .. "cmp"),
}

M.config = function()
	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

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
		ensure_installed = {
			"lua_ls",
			"bashls",
			"pylsp",
			"clangd",
			"gopls",
			"asm_lsp",
			"ts_ls",
		},
		automatic_installation = true,
		handlers = {
			function(server) -- a default method to setup servers
				lspconfig[server].setup({
					capabilities = lsp_capabilities,
				})
			end,
			lua_ls = function()
				lspconfig.lua_ls.setup(nvim_opts())
			end,
			bashls = function()
				lspconfig.bashls.setup({
					cmd = { "bash-language-server", "start" },
					filetypes = { "sh", "bash" },
				})
			end,
			html = function()
				lspconfig.html.setup({
					filetypes = { "html", "gotmpl" },
				})
			end,
		},
	})
end

return M
