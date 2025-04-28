-- Disable keymaps
local disable = {
	"<left>",
	"<right>",
	"<up>",
	"<down>",
}

for _, key in ipairs(disable) do
	vim.keymap.set("n", key, '<cmd> echo "Disabled! you **VIM Motions**"<CR>')
end

-- <Esc> to exit search mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Remap <Esc>
vim.keymap.set("i", "jk", "<Esc>")

-- Move lines
vim.keymap.set("v", ",", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", ".", ":m '<-2<CR>gv=gv")

-- Stay at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window switch
vim.keymap.set("n", "<C-h>", "<C-w>h") -- Left
vim.keymap.set("n", "<C-l>", "<C-w>l") -- Right 
vim.keymap.set("n", "<C-j>", "<C-w>j") -- Down
vim.keymap.set("n", "<C-k>", "<C-w>k") -- Up

-- System clipboard
vim.keymap.set("v", "<C-c>", '"+y')

-- File Tree
vim.keymap.set("n", "<leader>pv", "<cmd>:Explore<CR>")
