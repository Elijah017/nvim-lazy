local util = require('core.util')

local namespace = 'plugins.nav.'
local plugins = {
	'telescope',
}

return util.get_deps(namespace, plugins)
