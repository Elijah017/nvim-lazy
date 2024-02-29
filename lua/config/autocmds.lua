local file_root = os.getenv('HOME') .. '/.config/nvim/lua/plugins/*'

vim.api.nvim_create_autocmd({ 'FileType' }, {
  callback = function()
    if vim.bo.filetype == 'netrw' then
      vim.opt.colorcolumn = '0'
    else
      vim.opt.colorcolumn = '80'
    end
  end
})

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

