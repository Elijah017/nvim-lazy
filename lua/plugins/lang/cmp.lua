local M = { "hrsh7th/nvim-cmp", lazy = true }

M.dependencies = {
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "hrsh7th/cmp-nvim-lua", lazy = true },
}

M.config = function()
	local cmp = require("cmp")
	cmp.setup({
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "nvim_lua" },
		},
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item({ behaviour = "select" }),
			["<C-n>"] = cmp.mapping.select_next_item({ behaviour = "select" }),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
	})
end

return M
