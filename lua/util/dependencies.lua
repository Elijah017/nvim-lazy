---@class DependancyHandler
local dependancy_handler = {
  dependancies = {} ---@type table<string | table> 
}

---modifies self by merging the dependancies provided by deps
---@param self DependancyHandler
---@param deps table
dependancy_handler.merge = function(self, deps)
  for _, v in pairs(deps) do
    if v ~= nil then
      table.insert(self.dependancies, v)
    end
  end
end

---setups up a dependancy handler for the caller
---@param deps table<string | table>
---@param merge table | nil
---@return DependancyHandler
dependancy_handler.new = function(deps, merge)
  dependancy_handler.dependancies = deps
  if merge ~= nil then
    dependancy_handler:merge(merge)
  end
  return dependancy_handler
end

return dependancy_handler
