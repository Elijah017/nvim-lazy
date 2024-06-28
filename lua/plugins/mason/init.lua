local util = require('core.util')

local namespace = 'plugins.mason.'
local plugins = {
	'mason',
}

return util.get_deps(namespace, plugins)
