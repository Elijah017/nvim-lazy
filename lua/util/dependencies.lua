---@class DependancyHandler
local dependancy_handler = {}

---@type LazySpec[]
dependancy_handler.plugins = {}

---modifies self by merging the dependancies provided by deps
---@param deps LazySpec[]
function dependancy_handler:merge(deps)
  for _, v in pairs(deps) do
    if v ~= nil then
      table.insert(self.plugins, v)
    end
  end
end

---setups up a dependancy handler for the caller
---@param deps LazySpec[] | nil
---@param merge LazySpec[] | nil
---@return DependancyHandler
function dependancy_handler.new(deps, merge)
  if deps == nil then
    return dependancy_handler
  end

  dependancy_handler.plugins = deps
  if merge ~= nil then
    dependancy_handler:merge(merge)
  end
  return dependancy_handler
end

return dependancy_handler
