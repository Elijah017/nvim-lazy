local util = require("core.util")

local namespace = "plugins.extra."
local plugins = {
	"undotree",
	"whichkey",
	"lazygit",
}

return util.get_deps(namespace, plugins)
