local support = {
  "Jezda1337/nvim-html-css",
  lazy = true,
  event = { 'BufNewFile', 'BufReadPost', },
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
