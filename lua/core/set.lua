local function terminalLeft()
	vim.cmd([[ 70vsp | terminal ]])
	vim.cmd([[ set nonu | set nornu | startinsert ]])
end

local function terminal()
	vim.cmd([[ belowright 20sp | terminal ]])
	vim.cmd([[ set nonu | set nornu | startinsert ]])
end

local function resize_window_height()
	local size = vim.fn.input("size: ")
	vim.cmd("resize " .. size)
end

local function resize_window_length()
	local size = vim.fn.input("size: ")
	vim.cmd("vertical resize " .. size)
end

local cmd = {
	move_wLeft = "<C-h>",
	move_wRight = "<C-l>",
	move_wUp = "<C-k>",
	move_wDown = "<C-j>",
	wAbove = "<leader>wa",
	wBelow = "<leader>wb",
	wLeft = "<leader>wl",
	wRight = "<leader>wr",

	exit_terminal = "<Esc>",
	new_tLeft = "<leader>tl",
	new_tBelow = "<leader>tb",

	wresizev = "<leader>wh",
	wresizeh = "<leader>ww",
}

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Ex" })

-- Window management
vim.keymap.set("n", cmd.move_wLeft, "<C-w>h", { desc = "move to left window" })
vim.keymap.set("n", cmd.move_wRight, "<C-w>l", { desc = "move to right window" })
vim.keymap.set("n", cmd.move_wUp, "<C-w>k", { desc = "move to left window above" })
vim.keymap.set("n", cmd.move_wDown, "<C-w>j", { desc = "move to window below" })
vim.keymap.set("n", cmd.wLeft, "<cmd>vsp<cr>", { desc = "new window left" })
vim.keymap.set("n", cmd.wRight, "<cmd>belowright vsp<cr>", { desc = "new window right" })
vim.keymap.set("n", cmd.wAbove, "<cmd>sp<cr>", { desc = "new window above" })
vim.keymap.set("n", cmd.wBelow, "<cmd>belowright sp<cr>", { desc = "new window below" })

-- terminal windows
vim.keymap.set("t", cmd.exit_terminal, "<C-\\><C-n>", { desc = "escape terminal" })
vim.keymap.set("n", cmd.new_tLeft, terminalLeft, { desc = "Open vertical terminal" })
vim.keymap.set("n", cmd.new_tBelow, terminal, { desc = "Open horizontal terminal" })

-- resizing windows
vim.keymap.set("n", cmd.wresizev, resize_window_height, { desc = "resize window height" })
vim.keymap.set("n", cmd.wresizeh, resize_window_length, { desc = "resize window width" })

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Paste/Delete without yanking
vim.keymap.set("x", "<leader>p", [[ "_dp ]])
vim.keymap.set({ "n", "v" }, "<leader>d", [[ "_d ]])

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [[ "+y ]], { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [[ "+Y ]], { desc = "yank line to clipboard" })

-- Format entire file
vim.keymap.set("n", "==", vim.lsp.buf.format)

vim.keymap.set("n", "<space>", "<Nop>", { noremap = true })
