local util = require('core.util')

local namespace = 'plugins.mason.'
local plugins = {
	'mason',
  'dap',
}

return util.get_deps(namespace, plugins)
