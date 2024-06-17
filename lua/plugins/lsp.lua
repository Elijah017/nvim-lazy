-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
---@type DependancyHandler
local deps = require('util.dependencies').new({
  { 'williamboman/mason.nvim',           lazy = true },
  { 'williamboman/mason-lspconfig.nvim', lazy = true },
  { 'hrsh7th/cmp-nvim-lsp',              lazy = true },
  { 'L3MON4D3/LuaSnip',                  lazy = true },
  'hrsh7th/nvim-cmp',
})

---@type LazySpec
local lsp_config = {
  'neovim/nvim-lspconfig',
  lazy = true,
  event = { 'BufNewFile', 'BufReadPre', },
  keys = { { '<leader>ma', '<cmd>Mason<cr>', { desc = 'Mason', mode = 'n' } } },
  dependencies = deps.plugins,
  config = function()
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓ ",
          package_pending = "➜ ",
          package_uninstalled = "✗ "
        }
      }
    })
    local lsp_servers = require('util.language-servers')
    require('mason-lspconfig').setup({
      ensure_installed = lsp_servers.servers,
      handlers = lsp_servers.handlers,
    })

    lsp_servers.manual_servers_setup()
  end,
}

return lsp_config
