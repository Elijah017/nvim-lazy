vim.g.mapleader = " "
vim.g.maplocalleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local require_bootstrap = not vim.loop.fs_stat(lazypath)
if require_bootstrap then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = {
  install = {
    colorscheme = { 'catppuccin', 'tokyonight-night' },
  },
  change_detection = { notify = false, },
}

require('config.set')
require('config.keymaps')
require("lazy").setup("plugins", lazy_config)
require('config.autocmds')
