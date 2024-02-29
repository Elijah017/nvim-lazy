local undotree = {
  'mbbill/undotree',
  name = 'undotree',
  keys = {
    { '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = "Undo Tree", mode = 'n' } },
  },
  event = { 'BufNewFile', 'BufReadPost', },
}

return undotree
