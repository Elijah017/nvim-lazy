local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  name = 'treesitter',
  lazy = true,
  event = { 'BufNewFile', 'BufReadPost', },
  cmd = { 'TSUpdate', },
  dependencies = {
    require('util.notify'),
    {
      'windwp/nvim-ts-autotag',
      lazy = true,
      config = function()
        require('nvim-ts-autotag').setup()
      end,
    },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'c',
        'lua',
        'bash',
        'python',
        'html',
        'javascript',
        'typescript',
        'css',
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,
      auto_install = false,

      highlight = { enable = true, },

      indent = { enable = false },

      incremental_selection = { enable = true, },

      autotag = { enable = true },
    })
  end
}

return treesitter
