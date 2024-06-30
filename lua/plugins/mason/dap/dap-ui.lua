local M = { 'rcarriga/nvim-dap-ui', lazy = true }

M.keys = { { '<leader>dd', function() require('dapui').open() end, { mode = 'n', desc = 'open debug' } } }

M.dependencies = {
  "mfussenegger/nvim-dap",
  { "nvim-neotest/nvim-nio", lazy = true },
}

M.config = function()
  local dap = require("dap")
  local dapui = require("dapui")

  dapui.setup()

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
  end
end

return M
