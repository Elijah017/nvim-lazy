local util = require('core.util')

local namespace = 'plugins.nav.'
local plugins = {
  'telescope',
  'neotree',
  'dashboard',
}

return util.get_deps(namespace, plugins)
