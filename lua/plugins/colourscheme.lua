local schemes = {}

schemes.catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  config = function()
    require('catppuccin').setup({
      -- transparent_background = false,
      no_italic = true,
      color_overrides = {
        mocha = {
          -- base = "#1B1624",
          -- mantle = "#000000",
          -- crust = "#000000",
        },
      },
    })
    -- vim.cmd [[ colorscheme catppuccin ]]
  end,
}

schemes.tokyonight = {
  "folke/tokyonight.nvim",
  name = 'tokyonight',
  lazy = true,
  event = 'UIEnter',
  config = function()
    require('tokyonight').setup({
      style = 'night',
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    })
    vim.cmd [[ colorscheme tokyonight ]]
  end,
}

local colourschemes = {}
for _, v in pairs(schemes) do
  table.insert(colourschemes, v)
end

return colourschemes
