local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
}

tokyonight.config = function()
	require("tokyonight").setup({
		styles = {
			comments = { italic = false},
			keywords = { italic = false},
		},
	})
	vim.cmd[[colorscheme tokyonight-night]]
end

return tokyonight
