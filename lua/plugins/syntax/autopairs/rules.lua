local Rule = require("nvim-autopairs.rule")

local M = {}

-- Method on how to add rules
-- M[#M + 1] = Rule(">", "", { "html", "gotmpl" })
-- 	:with_pair(function()
-- 		return false
-- 	end)
-- 	:with_move(function(opts)
-- 		return opts.char == ">"
-- 	end)
-- 	:with_cr(function()
-- 		return false
-- 	end)
-- 	:with_del(function()
-- 		return false
-- 	end)
-- 	:use_key(">")

return M
