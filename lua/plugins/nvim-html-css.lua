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
    local Source = require('html-css')
    Source.enable_on = { 'html' }
    Source.file_extensions = { 'css', 'sass', 'less' }
    Source.style_sheets = {}
    Source:setup()
  end,
}

return support
