local fugitive = {
  'tpope/vim-fugitive',
  name = 'git',
  lazy = true,
  keys = {
    { '<leader>gf', vim.cmd.Git, { desc = "Git", mode = 'n' } },
  },
}

return fugitive
