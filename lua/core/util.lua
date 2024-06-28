local M = {}

--- loads all scripts in the pludings table and returns the appropriate
--- plugin spec array
---@param namespace string
---@param plugins string[]
---@returns LazySpec[]
M.get_deps = function(namespace, plugins)
	local spec = {}
	for _, v in ipairs(plugins) do
		local plugin = require(namespace .. v)
		if type(plugin[1]) ~= 'string' then
			M.merge_specs(spec, plugin)
		else
			spec[#spec + 1] = plugin
		end
	end
	return spec
end

--- Modifies left table inplace, merging the contents or the right table
---@param left LazySpec
---@param right LazySpec
M.merge_specs = function(left, right)
	for i=1, #right do
		left[#left + 1] = right[i]
	end
end

return M
