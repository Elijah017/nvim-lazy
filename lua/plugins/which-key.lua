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
	}, { mode = "n", prefix = "<leader>" })
end

return _ret
