local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  name = 'treesitter',
  lazy = true,
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
      autotag = { enable = true },
      ensure_installed = {
        'lua',
        'bash',
        'python',
        'html',
        'javascript',
        'typescript',
        'css',
      },
    })
  end
}

return treesitter
