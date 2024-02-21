local zero = {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
	},
}

zero.config = function()
	local lsp_zero = require('lsp-zero')

	require('mason').setup()
	require('mason-lspconfig').setup({
		ensure_installed = {},
		handlers = {
			lsp_zero.default_setup,
			lua_ls = function()
				local lua_opts = lsp_zero.nvim_lua_ls()
				require('lspconfig').lua_ls.setup(lua_opts)
			end,
		},
	})

	local cmp = require('cmp')
	local cmp_select = { behaviour = 'select' }
	cmp.setup({
		sources = { { name = 'nvim_lsp' }, },
		mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
			['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
			['<C-y>'] = cmp.mapping.confirm({select = true}),
			['<C-Space>'] = cmp.mapping.complete(),
		},
	})

	lsp_zero.on_attach(function(client, bufnr)
		lsp_zero.default_keymaps({buffer = bufnr})

		vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, { desc = "next warning" })
	end)
end

return zero
