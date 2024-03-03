local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  name = 'treesitter',
  lazy = true,
  cmd = { 'TSUpdate', },
  dependencies = { require('util.notify'), },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'bash', 'python', },
    })
  end
}

return treesitter
