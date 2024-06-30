local M = { "folke/which-key.nvim", lazy = false }

M.event = "VeryLazy"

M.init = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
end

M.config = function()
  local wk = require("which-key")

  wk.register({
    f = {
      name = "Telescope",
      f = { '<cmd> Telescope find_files <cr>', "Find files" },
      r = { '<cmd> Telescope live_grep <cr>', "Live grep" },
      b = { '<cmd> Telescope buffers <cr>', "Find buffers" },
      h = { '<cmd> Telescope help_tags <cr>', "Find help tags" },
      g = { '<cmd>Telescope git_files<cr>', "Find git files" },
      c = {
        function()
          require('telescope.builtin').colorscheme({ enable_preview = true })
        end,
        'Live Colourscheme Preview'
      },
    },
    { mode = 'n', prefix = '<leader>' }
  })
end

return M
