local _ret = {
	"ThePrimeagen/harpoon",
  lazy = true,
	dependencies = {
		{ 'nvim-lua/plenary.nvim', lazy = true },
	},
  keys = { '<leader>a', '<C-e>', '<leader>h' },
}

_ret.config = function()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark File" })
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Menu" })

	vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "Move to mark 1" })
	vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "Move to mark 2" })
	vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "Move to mark 3" })
	vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "Move to mark 4" })
	vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end, { desc = "Move to mark 5" })
	vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end, { desc = "Move to mark 6" })
	vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end, { desc = "Move to mark 7" })
	vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end, { desc = "Move to mark 8" })
	vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end, { desc = "Move to mark 9" })
end

return _ret
