---@type LazySpec
local M = { "stevearc/conform.nvim", lazy = true }

M.event = { "BufNewfile", "BufReadPre" }

M.dependencies = { "williamboman/mason.nvim" }

M.config = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "uncrustify" },
			cpp = { "uncrustify" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters = {
			astyle = {
				args = { "--project=" .. vim.fn.getcwd() .. "/.astylerc" },
			},
			uncrustify = {
				args = { "-c", vim.fn.getcwd() .. "/uncrustify.conf", "--replace", "$FILENAME", "--no-backup" },
				stdin = false,
			},
		},
	})
end

return M
