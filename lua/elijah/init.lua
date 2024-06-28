vim.g.mapleader = ' '

require('core')
local util = require('core.util')

---@type table[LazyPluginSpec]
local M = {}

local modules = {
	'plugins.colour',
	'plugins.nav',
	'plugins.mason',
}

-- Set colourscheme and all related aspects
for _, v in ipairs(modules) do
	util.merge_specs(M, require(v))
end

return M
