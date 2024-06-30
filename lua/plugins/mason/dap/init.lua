local util = require('core.util')

local namespace = 'plugins.mason.dap.'
local plugins = {
  'dap',
  'dap-ui',
  -- 'dap-projects',
}

local M = util.get_deps(namespace, plugins)

return M
