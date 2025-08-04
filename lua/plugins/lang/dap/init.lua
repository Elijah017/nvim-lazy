local util = require("core.util")

local namespace = "plugins.lang.dap."
local plugins = {
	"dap",
	"dap-ui",
	"dap-python",
}

local M = util.get_deps(namespace, plugins)

return M
