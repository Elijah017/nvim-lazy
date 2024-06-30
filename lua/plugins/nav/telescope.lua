---@type LazyPluginSpec
local M = { 'nvim-telescope/telescope.nvim', branch = '0.1.x', lazy = false }

M.dependencies = { 'nvim-lua/plenary.nvim', }

M.keys = {
  { "<leader>f", "", desc = "+telescope", mode = 'n' }
}

return M
