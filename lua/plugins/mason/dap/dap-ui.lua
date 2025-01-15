local M = { "rcarriga/nvim-dap-ui", lazy = true }

M.dependencies = {
	{ "nvim-neotest/nvim-nio", lazy = true },
}

M.config = function()
	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup()

	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

return M
