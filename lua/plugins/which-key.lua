local _ret = {
	"folke/which-key.nvim",
	event = "VeryLazy",
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
	}, { mode = "n", prefix = "<leader>" })
end

return _ret
