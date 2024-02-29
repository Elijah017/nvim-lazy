local lazygit = {
  "kdheepak/lazygit.nvim",
  name = 'lazygit',
  lazy = true,
  -- optional for floating window border decoration
  dependencies = {
    'telescope',
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {'<leader>gl', '<cmd>LazyGit<cr>', { desc = "Open lazygit", mode = 'n' }},
  },
  config = function()
    require('telescope').load_extension('lazygit')
  end
}

return lazygit
