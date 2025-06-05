local M = { "nvim-lualine/lualine.nvim", name = "lualine" }
M.dependencies = { "nvim-tree/nvim-web-devicons" }

M.lazy = true
M.event = { "VeryLazy" }

local lsp_name = function()
	local msg = ""
	local buf_ft = vim.api.nvim_get_option_value("filetype", {})
	local clients = vim.lsp.get_clients() ---@type vim.lsp.Client
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

local config = {
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { "branch", "diff", "diagnostics" },
		lualine_x = {
			lsp_name,
			"filetype",
			{
				"encoding",
				fmt = string.upper,
			},
			"fileformat",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

M.opts = config

return M
