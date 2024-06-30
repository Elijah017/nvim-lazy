-- Sets working directory to project root even if called from further internal file
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local root = vim.fs.root(0, { '.git', '.nvim' })
    if root ~= nil then
      vim.cmd('cd ' .. root)
    end
  end,
})
