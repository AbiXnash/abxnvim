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

-- Quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

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

-- [[ File Navigation with netrw ]]

local last_buffer = nil

vim.keymap.set("n", "<leader>e", function()
	local current_buf = vim.api.nvim_get_current_buf()

	-- If already in netrw or file explorer, switch back to last buffer
	if last_buffer and vim.bo.filetype == "netrw" then
		vim.api.nvim_set_current_buf(last_buffer)
		last_buffer = nil
	else
		-- Save current buffer before opening netrw
		last_buffer = current_buf
		vim.cmd("e .") -- Open the current directory
	end
end, { desc = "Toggle File Explorer" })

-- [[ File Navigation: Left and Right movement disable ]]

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "h", "<NOP>", { buffer = true })
		vim.keymap.set("n", "l", "<NOP>", { buffer = true })
	end,
})

-- [[ harpoon ]]

local harpoon = require("harpoon")
local harpoon_ui = require("harpoon.ui")
local harpoon_list = require("harpoon.mark")

--  add current file to harpoon
vim.keymap.set("n", "<leader>ha", function()
	harpoon_list.add_file()
end, { desc = "harpoon add file" })

--  open harpoon menu
vim.keymap.set("n", "<leader>hm", function()
	harpoon_ui.toggle_quick_menu()
end, { desc = "harpoon menu" })

--  navigate to files
vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end, { desc = "harpoon file 1" })
vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end, { desc = "harpoon file 2" })
vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end, { desc = "harpoon file 3" })
vim.keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end, { desc = "harpoon file 4" })

--  cycle through harpoon files
vim.keymap.set("n", "<c-n>", function()
	harpoon:list():next()
end, { desc = "next harpoon file" })
vim.keymap.set("n", "<c-p>", function()
	harpoon:list():prev()
end, { desc = "previous harpoon file" })
