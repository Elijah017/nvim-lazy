local support = {
  "Jezda1337/nvim-html-css",
  lazy = true,
  ft = { 'html', 'css', 'htmldjango', },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('html-css'):setup()
  end,
}

return support
