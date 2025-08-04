---@type LazySpec
local M = { "mfussenegger/nvim-dap-python", lazy = true, ft = { "python" } }

M.dependencies = { "mfussenegger/nvim-dap" }

M.config = function()
	require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter")
end

return M
