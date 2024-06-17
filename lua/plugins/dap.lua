---@type DependancyHandler
local M = require('util.dependencies').new()

---@type LazySpec
local core = {
  'mfussenegger/nvim-dap',
  lazy = true,
  config = function()
    local dap = require('dap')
    vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = "debug continue" })
    vim.keymap.set('n', '<leader>ds', function() dap.step_over() end, { desc = "step over" })
    vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = "step into" })
    vim.keymap.set('n', '<leader>do', function() dap.step_out() end, { desc = "step out" })
    vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, { desc = "toggle breakpoint" })
    vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input("Breakpoint Condition: ")) end, { desc = "condition breakpoint" })
    vim.keymap.set('n', '<leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "break with message" })
    vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end, { desc = "open dap" })
  end,
}

---@type LazySpec
local python_dap = {
  'mfussenegger/nvim-dap-python',
  lazy = true,
  ft = 'python',
  dependencies = { 'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui', },
  config = function()
    require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/')
  end,
}

---@type LazySpec
local dap_ui = {
  'rcarriga/nvim-dap-ui',
  lazy = true,
  dependencies = {
    'mfussenegger/nvim-dap',
    {
      'nvim-neotest/nvim-nio',
      lazy = true,
    }
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}

M:merge({ core, python_dap, dap_ui, })

return M.plugins
