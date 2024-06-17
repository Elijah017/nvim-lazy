local noice = {
  "folke/noice.nvim",
  name = 'noice',
  lazy = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
  end,
  keys = {
    '<leader>f',
  },
}

return noice
