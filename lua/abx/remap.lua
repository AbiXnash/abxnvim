require("abx.keymaps.harpoon-map")
require("abx.keymaps.netrw-map")
require("abx.keymaps.telescope-map")
require("abx.keymaps.lsp-map")
require("abx.keymaps.trouble-map")
require("abx.keymaps.comments-map")
-- Cap Q
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- <Esc> to exit search mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "J", "<cmd>nop<CR>")

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Quickfix list" })

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

-- Line Navigation
vim.keymap.set("n", "H", "^", { desc = "Go to first word of the line" })
vim.keymap.set("n", "L", "g_", { desc = "Go to end of the line (excluding newline)" })

-- Window Switch
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {
	desc = "Undo Tree UI",
})
