require("abx.keymaps.harpoon-map")

-- Cap Q
vim.keymap.set("n", "Q", "<nop>")

-- <Esc> to exit search mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

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

-- Line Navigation

vim.keymap.set("n", "H", "^", { desc = "Go to first word of the line" })
vim.keymap.set("n", "L", "g_", { desc = "Go to end of the line (excluding newline)" })

-- [[ Quickfix ]]

-- Quickfix Navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous Quickfix Item" })

-- Location List Navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location List Item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous Location List Item" })

-- Open & Close Quickfix List
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open Quickfix List" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close Quickfix List" })

-- Open & Close Location List
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<CR>", { desc = "Open Location List" })
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<CR>", { desc = "Close Location List" })

-- Navigate Quickfix List and Jump to the Error Location
vim.keymap.set("n", "<C-n>", function()
	vim.cmd("cnext") -- Move to next error
	vim.cmd("cc") -- Jump to the corresponding location
end, { desc = "Next Quickfix Item & Jump" })

vim.keymap.set("n", "<C-p>", function()
	vim.cmd("cprev") -- Move to previous error
	vim.cmd("cc") -- Jump to the corresponding location
end, { desc = "Previous Quickfix Item & Jump" })

-- Replace
vim.keymap.set("n", "<Leader>r", function()
	local word = vim.fn.expand("<cword>")
	local new_word = vim.fn.input("Replace " .. word .. " with: ")
	if new_word ~= "" then
		vim.cmd(":%s/\\<" .. word .. "\\>/" .. new_word .. "/gc")
	end
end, { noremap = true, silent = false })

vim.keymap.set("n", "<Leader>R", function()
	local word = vim.fn.expand("<cword>")
	local new_word = vim.fn.input("Replace (ignore case) " .. word .. " with: ")
	if new_word ~= "" then
		vim.cmd(":%s/\\<" .. word .. "\\>/" .. new_word .. "/gIc")
	end
end, { noremap = true, silent = false })

-- Toggle Comment
vim.keymap.set("n", "<leader>/", function()
	vim.cmd("normal! gcc")
end, { desc = "Toggle Comment" })

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {
	desc = "Undo Tree UI",
})
