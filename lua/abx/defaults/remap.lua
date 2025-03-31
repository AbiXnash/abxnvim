local harpoon = require("harpoon")

-- Cap Q
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- <Esc> to exit search mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- vim.keymap.set("n", "J", "<cmd>nop<CR>")

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Enter Normal Mode
vim.keymap.set("i", "jk", "<Esc>")

-- Move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stay at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Split Screen
vim.keymap.set("n", "<C-s>", ":split<CR>", { noremap = true, silent = true }) -- Ctrl + s for horizontal split
vim.keymap.set("n", "<C-v>", ":vsplit<CR>", { noremap = true, silent = true }) -- Ctrl + v for vertical split

-- Window Switch
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {
	desc = "Undo Tree UI",
})

harpoon:setup() -- Correct Harpoon v2 setup

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Harpoon: Add file" })
vim.keymap.set("n", "<leader>hm", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: Open menu" })

vim.keymap.set("n", "<leader>hh", function()
	harpoon:list():select(1)
end, { desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<leader>hj", function()
	harpoon:list():select(2)
end, { desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<leader>hk", function()
	harpoon:list():select(3)
end, { desc = "Harpoon: Go to file 3" })
vim.keymap.set("n", "<leader>hl", function()
	harpoon:list():select(4)
end, { desc = "Harpoon: Go to file 4" })

-- Cycle through files
vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "Harpoon: Next file", silent = true })
vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "Harpoon: Previous file", silent = true })

-- [[ File Navigation with netrw ]]

local last_buffer = nil

vim.keymap.set("n", "<leader>pv", function()
	local current_buf = vim.api.nvim_get_current_buf()

	-- If already in netrw or file explorer, switch back to last buffer
	if last_buffer and vim.bo.filetype == "netrw" then
		vim.api.nvim_set_current_buf(last_buffer)
		last_buffer = nil
	else
		-- Save current buffer before opening netrw
		last_buffer = current_buf
		vim.cmd("Ex") -- Open the current directory
	end
end, { desc = "Toggle File Explorer" })

-- [[ Telescope ]]
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", builtin.git_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Search >> ") })
end, { desc = "Telescope help tags" })

-- trouble_keymap.lua (Keymap configurations for Trouble)
vim.keymap.set("n", "<leader>q", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
