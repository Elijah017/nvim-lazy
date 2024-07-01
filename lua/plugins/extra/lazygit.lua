local M = { 'kdheepak/lazygit.nvim', lazy = true }

M.dependecies = { 'nvim-lua/plenary.nvim', }

M.keys = {
  { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
}

return M
