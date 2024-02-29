local bufferline = {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = true,
  event = { 'BufNewFile', 'BufReadPre' },
}

return bufferline
