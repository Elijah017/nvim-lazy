local support = {
  "Jezda1337/nvim-html-css",
  lazy = true,
  event = { 'BufNewFile', 'BufReadPost', },
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", lazy = true, },
    { "nvim-lua/plenary.nvim",           lazy = true, },
  },
  config = function()
    require("html-css"):setup()
    require('cmp').setup({
      sources = {
        { name = 'html-css' },
      },
      formatting = {
        format = function(entry, vim_item)
          if entry.source.name == "html-css" then
            vim_item.menu = entry.completion_item.menu
          end
          return vim_item
        end
      },
    })
  end
}

return support
