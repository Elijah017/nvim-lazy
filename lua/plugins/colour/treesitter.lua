local M = { 'nvim-treesitter/nvim-treesitter', lazy = true }

local autotag = {
  'windwp/nvim-ts-autotag',
  lazy = true,
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}

M.event = { 'BufNewFile', 'BufReadPost', }
M.cmd = { 'TSUpdate', }

M.dependencies = { autotag }

M.config = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'c',
      'cmake',
      'cpp',
      'lua',
      'bash',
      'markdown',
      'go',
      'python',
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = false,

    highlight = { enable = true, },

    indent = { enable = false },

    incremental_selection = { enable = true, },

    autotag = { enable = false },
  })
end

return M
