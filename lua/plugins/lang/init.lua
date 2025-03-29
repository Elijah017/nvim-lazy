local util = require("core.util")

local namespace = "plugins.lang."
local plugins = {
	"mason",
	"dap",
	"conform",
}

return util.get_deps(namespace, plugins)
