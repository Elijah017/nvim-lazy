local zero = {
  'VonHeikemen/lsp-zero.nvim',
  name = 'lsp',
  branch = 'v3.x',
  lazy = true,
  event = { 'BufNewFile', 'BufReadPre' },
  dependencies = {
    { 'williamboman/mason.nvim',           lazy = true },
    { 'williamboman/mason-lspconfig.nvim', lazy = true },
    { 'neovim/nvim-lspconfig',             lazy = true },
    { 'hrsh7th/cmp-nvim-lsp',              lazy = true },
    { 'hrsh7th/nvim-cmp',                  lazy = true },
    { 'L3MON4D3/LuaSnip',                  lazy = true },
  },
  keys = {
    { '<leader>ma', '<cmd>Mason<cr>', { desc = "Mason", mode = 'n' }, },
  },
}

zero.config = function()
  local lsp_zero = require('lsp-zero')

  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓ ",
        package_pending = "➜ ",
        package_uninstalled = "✗ "
      }
    }
  })
  require('mason-lspconfig').setup({
    ensure_installed = {
      'lua_ls',
      'bashls',
      'clangd',
      'pylsp',
      'cssls',
      'html',
      'eslint',
      'tsserver',
    },
    handlers = {
      lsp_zero.default_setup,
      lua_ls = function()
        local lua_opts = lsp_zero.nvim_lua_ls()
        require('lspconfig').lua_ls.setup(lua_opts)
      end,
      bashls = function()
        require("lspconfig").bashls.setup {
          cmd = { "bash-language-server", "start" },
          filetypes = { "sh", "bash" }
        }
      end,
    },
  })

  local cmp = require('cmp')
  local cmp_select = { behaviour = 'select' }
  cmp.setup({
    sources = { { name = 'nvim_lsp' }, },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<C-Space>'] = cmp.mapping.complete(),
    },
  })

  lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, { desc = "previous warning" })
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, { desc = "next warning" })
  end)

  lsp_zero.setup_servers({ 'lua_ls', 'bashls', })
end

return zero
