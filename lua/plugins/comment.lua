local comment = {
  'numToStr/Comment.nvim',
  name = 'comment',
  event = { 'BufNewFile', 'BufReadPost' },
  config = function()
    require('Comment').setup()
  end,
}

return comment
