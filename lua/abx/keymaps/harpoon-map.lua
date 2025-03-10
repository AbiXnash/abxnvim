local harpoon = require("harpoon")

-- Initialize Harpoon
harpoon.setup({})

-- Define keymaps
vim.keymap.set("n", "<leader>ha", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file to Harpoon" })

vim.keymap.set("n", "hm", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle Harpoon menu" })

-- Navigation between files
vim.keymap.set("n", "<leader>1", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "Navigate to Harpoon file 1" })

vim.keymap.set("n", "<leader>2", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "Navigate to Harpoon file 2" })

vim.keymap.set("n", "<leader>3", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "Navigate to Harpoon file 3" })

vim.keymap.set("n", "<leader>4", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "Navigate to Harpoon file 4" })

vim.keymap.set("n", "<C-]>", function()
	require("harpoon.ui").nav_next()
end, { desc = "Navigate to next Harpoon mark" })

vim.keymap.set("n", "<C-[>", function()
	require("harpoon.ui").nav_prev()
end, { desc = "Navigate to previous Harpoon mark" })
