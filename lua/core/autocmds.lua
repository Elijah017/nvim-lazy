-- Sets working directory to project root even if called from further internal file
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local root = vim.fs.root(0, { '.git', '.nvim' })
    if root then
      vim.cmd('cd ' .. root)
    end
  end,
})

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   callback = function()
--     local client = vim.lsp.get_clients()[1]
--
--     -- Client may be nil
--     if client then
--       -- Check if the server supports formatting
--       if client.server_capabilities.documentFormattingProvider then
--         -- Sync formatting prevents weird buffer interactions
--         vim.lsp.buf.format({ async = false })
--       end
--     end
--   end,
-- })
