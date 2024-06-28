---@type PluginSpec
local M = {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  keys = {
    { '<leader>ff', '<cmd> Telescope find_files <cr>', { mode = 'n', desc = 'Find Files' } },
    { '<leader>fr', '<cmd> Telescope live_grep <cr>',  { mode = 'n', desc = 'Find Files' } },
    { '<leader>fb', '<cmd> Telescope buffers <cr>',    { mode = 'n', desc = 'Find Files' } },
    { '<leader>fh', '<cmd> Telescope help_tags <cr>',  { mode = 'n', desc = 'Find Files' } },
    { '<leader>fg', '<cmd>Telescope git_files<cr>',    { mode = 'n', desc = 'Find Git Files' } },
    { '<leader>fc',
      function()
        require('telescope.builtin').colorscheme({ enable_preview = true })
      end,
      { mode = 'n', desc = 'Live Colourscheme Preview' }
    },
  },
}

return M
