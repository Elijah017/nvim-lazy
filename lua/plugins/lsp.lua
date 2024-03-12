-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
local nvim_workspace = function(opts)
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  local config = {
    settings = {
      Lua = {
        -- Disable telemetry
        telemetry = { enable = false },
        runtime = {
          -- Tell the language server which version of Lua you're using
          -- (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' }
        },
        workspace = {
          checkThirdParty = false,
          library = {
            -- Make the server aware of Neovim runtime files
            vim.fn.expand('$VIMRUNTIME/lua'),
            vim.fn.stdpath('config') .. '/lua'
          }
        }
      }
    }
  }

  return vim.tbl_deep_extend('force', config, opts or {})
end

local lsp_config = {
  'neovim/nvim-lspconfig',
  lazy = true,
  event = { 'BufNewFile', 'BufReadPre', },
  keys = { { '<leader>ma', '<cmd>Mason<cr>', { desc = 'Mason', mode = 'n' } } },
  dependencies = {
    { 'williamboman/mason.nvim',           lazy = true },
    { 'williamboman/mason-lspconfig.nvim', lazy = true },
    { 'hrsh7th/cmp-nvim-lsp',              lazy = true },
    { 'hrsh7th/nvim-cmp',                  lazy = true },
    { 'L3MON4D3/LuaSnip',                  lazy = true },
  },
  config = function()
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    local default_setup = function(server)
      require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
      })
    end

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
        'pylsp',
        'cssls',
        'html',
        'eslint',
        -- 'tsserver',
      },
      handlers = {
        default_setup,
        lua_ls = function()
          require('lspconfig').lua_ls.setup(nvim_workspace())
        end,
        bashls = function()
          require('lspconfig').bashls.setup({
            cmd = { "bash-language-server", "start" },
            filetypes = { "sh", "bash" }
          })
        end,
      },
    })

    -- setup manually installed lsp's
    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup({})

    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item({ behaviour = 'select' }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behaviour = 'select' }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end,
}

return lsp_config
