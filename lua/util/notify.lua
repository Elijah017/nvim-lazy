return {
  "rcarriga/nvim-notify",
  lazy = true,
  event = 'UIEnter',
  config = function()
    require('notify').setup({
      timeout = 3000,
      max_height = function()
        return math.floor(vim.api.nvim_win_get_height(0) * 0.4)
      end,
      max_width = function()
        return math.floor(vim.api.nvim_win_get_width(0) * 0.4)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      render = 'wrapped-compact',
      stages = 'fade',
    })
    vim.notify = require('notify')
  end,
}
