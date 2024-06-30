local M = { 'ldelossa/nvim-dap-projects', lazy = false }

M.config = function()
  -- searchs for `{cwd}/.nvim/nvim-dap.lua`
  require('nvim-dap-projects').search_project_config()
end

return M
