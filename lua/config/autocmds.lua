local file_root = os.getenv('HOME') .. '/.config/nvim/lua/plugins/*'

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  callback = function()
    if  vim.bo.filetype == 'markdown' then
      vim.opt.wrap = true
    else
      vim.opt.wrap = false
    end
  end
})

-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--   callback = function()
--     if vim.bo.filetype == 'netrw' then
--       vim.opt.colorcolumn = '0'
--     else
--       vim.opt.colorcolumn = '80'
--     end
--   end
-- })

-- vim.api.nvim_create_autocmd({ 'BufWritePost', }, {
--   pattern = file_root,
--   callback = function()
--     local plugin = vim.fn.expand('%'):match('^.*/(.+)$'):gsub('.lua', '')
--
--     if plugin == 'colourscheme' then
--       local scheme = vim.g.colors_name
--       if scheme:find('catppuccin') then scheme = 'catppuccin' end
--       plugin = scheme .. ' lualine'
--     end
--
--     if plugin ~= 'whichkey' then plugin = plugin .. ' whichkey' end
--     vim.cmd("Lazy reload " .. plugin)
--   end
-- })
