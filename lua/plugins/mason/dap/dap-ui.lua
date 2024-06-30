local M = { 'rcarriga/nvim-dap-ui', lazy = true }

M.keys = { { '<leader>dd', function() require('dapui').open() end, { mode = 'n', desc = 'open debug' } } }

M.dependencies = {
  "mfussenegger/nvim-dap",
  { "nvim-neotest/nvim-nio", lazy = true },
  { 'folke/neodev.nvim',     lazy = true },
}

M.config = function()
  require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
  })

  require('dapui').setup()

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
end

return M
