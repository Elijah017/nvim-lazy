local nvim_cmp = {
  'hrsh7th/nvim-cmp',
  lazy = true,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp',     lazy = true, },
    { "hrsh7th/cmp-buffer",       lazy = true, },
    { "hrsh7th/cmp-path",         lazy = true, },
    { "saadparwaiz1/cmp_luasnip", lazy = true, },
    { "hrsh7th/cmp-nvim-lua",     lazy = true, },
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        {
          name = 'html-css',
          option = {
            max_count = {},                              -- not ready yet
            enable_on = { "html", },                     -- set the file types you want the plugin to work on
            file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
            style_sheets = {
              -- example of remote styles, only css no js for now
              -- "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
              -- "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
            },
          },
        },
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
