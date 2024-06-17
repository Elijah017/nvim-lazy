local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  name = 'treesitter',
  -- event = 'UIEnter',
  lazy = true,
  build = ':TSUpdate',
  cmd = { 'TSUpdate', 'TSInstall', },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'c_sharp', },
    })
  end,
}

local deps = require('util.dependencies').new({
  { 'nvim-lua/plenary.nvim', lazy = true },
  "rcarriga/nvim-notify",
  treesitter,
}, require('plugins.colourscheme'))

local telescope = {
  'nvim-telescope/telescope.nvim',
  name = 'telescope',
  branch = '0.1.x',
  lazy = true,
  cmd = { 'Telescope', },
  dependencies = deps.plugins,
  keys = { '<leader>f', },
}

telescope.config = function()
  vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
  vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find Git Files" })
  vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
  vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
  vim.keymap.set("n", "<leader>fr", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })
  vim.keymap.set('n', "<leader>fc", function()
    require('telescope.builtin').colorscheme({ enable_preview = true })
  end, { desc = "Live Colourscheme Preview" })

  require('telescope').load_extension('notify')
  vim.keymap.set('n', '<leader>fn', '<cmd>Telescope notify<cr>', { desc = "Notification History" })
end

return telescope
