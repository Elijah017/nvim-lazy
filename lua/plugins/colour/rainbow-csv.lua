---@type LazySpec
local M = {
	"mechatroner/rainbow_csv",
	name = "rainbow_csv",
	lazy = true,
	event = { "BufNewFile", "BufReadPre" },
}

return M
