local M = { "folke/which-key.nvim", lazy = false }

M.event = "VeryLazy"

M.init = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
end

M.config = function()
  local wk = require("which-key")

  wk.add({
    mode = 'n',
    { "<leader>f",  group = "telescope" },
    { "<leader>fb", "<cmd> Telescope buffers <cr>", desc = "Find buffers" },
    {
      "<leader>fc",
      function()
        require('telescope.builtin').colorscheme({ enable_preview = true })
      end,
      desc = "Live Colourscheme Preview"
    },
    { "<leader>ff", "<cmd> Telescope find_files <cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>",    desc = "Find git files" },
    { "<leader>fh", "<cmd> Telescope help_tags <cr>",  desc = "Find help tags" },
    { "<leader>fr", "<cmd> Telescope live_grep <cr>",  desc = "Live grep" },
  })

  wk.add({
    mode = 'n',
    { '<leader>w', group = "window" },
  })
  wk.add({
    mode = 'n',
    { '<leader>t', group = "terminal" },
  })

  wk.add({
    mode = 'n',
    { '<leader>ma', desc = "Mason" },
  })
  wk.add({
    mode = 'n',
    { '<leader>u', desc = "Undo Tree" },
  })
end

return M
