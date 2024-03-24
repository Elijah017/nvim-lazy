local _ret = {
	"folke/which-key.nvim",
  name = 'whichkey',
  lazy = true,
  keys = { '<leader>', },
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
}

_ret.config = function()
	local wk = require("which-key")

	wk.register({
		f = "Telescope",
		h = "Harpoon",
    r = "Reload",
    t = "Terminal",
    w = "Window",
    a = "Mark File",
    u = "UndotreeToggle",
    g = "Git",
    m = "Mason",
    Y = { '"+Y', "yank line to clipboard" },
	}, { mode = "n", prefix = "<leader>" })

  wk.register({
    y = { '"+y', "yank to clipboard" },
  }, { mode = { 'n', 'v' }, prefix = '<leader>' })
end

return _ret
