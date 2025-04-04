local M = {}

--- loads all scripts in the `plugins` table and returns the appropriate
--- plugin spec array
---@param namespace string
---@param plugins string[]
---@returns LazySpec[]
M.get_deps = function(namespace, plugins)
	local spec = {}
	for _, v in ipairs(plugins) do
		local plugin = require(namespace .. v)
		if type(plugin[1]) ~= "string" then
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
	for i = 1, #right do
		left[#left + 1] = right[i]
	end
end

--- Checks whether a file (including directories) exists at the supplied path
---@param path string
---@return boolean
M.file_exists = function(path)
	if type(path) ~= "string" then
		return false
	end
	return os.rename(path, path) and true or false
end

--- Retrieves the specified config from either the project root, or the default
--- config from the conform data directory
---@param conf_name string
---@return string
M.get_format_config = function(conf_name)
	local config = vim.g.root_dir .. "/" .. conf_name
	if not M.file_exists(config) then
		config = vim.fn.stdpath("data") .. "/conform/" .. conf_name
	end
	return config
end

return M
