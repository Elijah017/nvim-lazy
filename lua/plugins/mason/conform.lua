---@type LazySpec
local M = { "stevearc/conform.nvim", lazy = true }

M.event = { "BufNewfile", "BufReadPre" }

M.dependencies = { "williamboman/mason.nvim" }

M.config = function()
	local uncrustify_file = vim.g.root_dir .. "/uncrustify.conf"
	if not require("core.util").file_exists(uncrustify_file) then
		uncrustify_file = vim.fn.stdpath("data") .. "/conform/uncrustify.conf"
	end

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
				args = {
					"-c",
					uncrustify_file,
					"--replace",
					"$FILENAME",
					"--no-backup",
				},
				stdin = false,
			},
		},
	})
end

return M
