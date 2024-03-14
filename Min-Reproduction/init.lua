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

require('lazy').setup({
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        event = { 'BufNewFile', 'BufReadPre', },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'hrsh7th/nvim-cmp',
        },
        config = function()
            require("mason").setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', },
                handlers = { lua_ls = function() require('lspconfig').lua_ls.setup({}) end, },
            })
        end,
    }
    {
    'hrsh7th/nvim-cmp',
    lazy = true,
    config = function()
        local cmp = require('cmp').setup({
        sources = {
            { name = 'nvim_lsp' },
            { name = 'html-css' },
        },
        formatting = {
            format = function(entry, vim_item)
            if entry.source.name == "html-css" then
                vim_item.menu = entry.completion_item.menu
            end
            return vim_item
            end
        },
        })
    end,
    },
    {
        "Jezda1337/nvim-html-css",
        lazy = true,
        event = { 'BufNewFile', 'BufReadPost', },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require('html-css'):setup()
        end,
    },

})