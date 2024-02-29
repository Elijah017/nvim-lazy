local noice = {
  "folke/noice.nvim",
  name = 'noice',
  lazy = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
    require('util.notify'),
  },
  config = function()
  end,
  keys = {
    '<leader>f',
  },
}

return noice
