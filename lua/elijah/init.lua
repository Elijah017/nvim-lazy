require('lazytypes')

---@type table[LazyPluginSpec]
local M = {}

-- Set colourscheme and all related aspects
M[#M + 1] = require('colour')

return M
