local util = require("core.util")

local namespace = "plugins.syntax."
local plugins = {
	"autopairs",
	"treesitter",
}

return util.get_deps(namespace, plugins)
