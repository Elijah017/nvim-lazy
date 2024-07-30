local util = require('core.util')

local namespace = 'plugins.mason.dap.'
local plugins = {
  'dap',
  'dap-ui',
}

local M = util.get_deps(namespace, plugins)

return M
