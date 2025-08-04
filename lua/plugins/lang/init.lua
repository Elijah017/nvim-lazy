local util = require("core.util")

local namespace = "plugins.lang."
local plugins = {
	"mason",
	"mason-lspconfig",
	"dap",
	"conform",
}

return util.get_deps(namespace, plugins)
