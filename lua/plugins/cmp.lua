local nvim_cmp = {
  'hrsh7th/nvim-cmp',
  lazy = true,
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'html-css' },
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
}

return nvim_cmp
