local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
}


local tokyonight = {
	"folke/tokyonight.nvim",
  name = 'tokyonight',
  -- event = 'UIEnter',
  lazy = true,
  opts = {
    style = 'night',
    styles = {
      comments = { italic = false},
      keywords = { italic = false},
    },
  },
}


local colourschemes = {
  names = {}, ---@type table<string>
  schemes = {},
}

local schemes = {
  catppuccin = catppuccin,
  tokyonight = tokyonight,
}

---comment
---@param name string
---@param opts table|nil
---@return table
colourschemes.setup = function(name, opts)
  if schemes[name] ~= nil then
    schemes[name].event = 'UIEnter'

    if opts ~= nil then
      schemes[name].config = function()
        require(name).setup(opts)
        vim.cmd("colorscheme " .. name)
      end

    else
      schemes[name].config = function()
        vim.cmd("colorscheme " .. name)
      end

    end -- end config if/else
  end
  for k, v in pairs(schemes) do
    table.insert(colourschemes.names, k)
    table.insert(colourschemes.schemes, v)
  end
  return colourschemes.schemes
end

return colourschemes
