vim.opt.guicursor = 'i-ci-ve:ver25'

vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10

-- long running undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.opt.undofile = true

vim.opt.colorcolumn = '80'
