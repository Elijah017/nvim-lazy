local M = { 'mfussenegger/nvim-dap', lazy = true }

M.event = { 'BufNewFile', 'BufReadPre' }

M.config = function()
  local dap = require('dap')

  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
  }

  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = "${workspaceFolder}",
      stopAtBeginningOfMainSubprogram = false,
    },
  }
end

M.keys = {
  {
    '<leader>db',
    function() require('dap').toggle_breakpoint() end,
    { mode = 'n', desc = 'Toggle Breakpoint' }
  },
  {
    '<leader>dc',
    function() require('dap').continue() end,
    { mode = 'n', desc = 'Start/Continue Debugging' }
  },
  {
    '<leader>di',
    function() require('dap').step_into() end,
    { mode = 'n', desc = 'Step Into' }
  },
  {
    '<leader>do',
    function() require('dap').step_over() end,
    { mode = 'n', desc = 'Step Over' }
  },
}

return M
