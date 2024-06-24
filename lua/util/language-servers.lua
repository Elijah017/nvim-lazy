local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local nvim_opts = function(opts)
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

local M = {
  servers = {
    'lua_ls',
    'bashls',
    'clangd',
  },
}

M.manual_servers_setup = function()
  -- lspconfig.clangd.setup({})
  lspconfig.pylsp.setup({})
end

M.handlers = {
  function(server) -- a default method to setup servers
    lspconfig[server].setup({
      capabilities = lsp_capabilities,
    })
  end,
  lua_ls = function()
    lspconfig.lua_ls.setup(nvim_opts())
  end,
  bashls = function()
    lspconfig.bashls.setup({
      cmd = { "bash-language-server", "start" },
      filetypes = { "sh", "bash" }
    })
  end,
}

return M
