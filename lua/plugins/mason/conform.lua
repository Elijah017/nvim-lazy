---@type LazySpec
local M = { "stevearc/conform.nvim", lazy = true }

M.event = { "BufNewfile", "BufReadPre" }

M.dependencies = { "williamboman/mason.nvim" }

M.config = function()
	local util = require("core.util")
	require("conform").setup({
		log_level = vim.log.levels.DEBUG,
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "astyle" },
			cpp = { "uncrustify" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters = {
			astyle = {
				args = { "--project=" .. util.get_format_config(".astylerc") },
			},
			uncrustify = {
				args = {
					"-c",
					util.get_format_config("uncrustify.conf"),
					"--replace",
					"$FILENAME",
					"--no-backup",
				},
				stdin = false,
			},
			prettier = {
				args = {
					"--stdin-filepath",
					"$FILENAME",
					"--config",
					util.get_format_config("prettier.yml"),
				},
			},
		},
	})
end

return M
