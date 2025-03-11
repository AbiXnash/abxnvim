local harpoon = require("harpoon")

harpoon:setup() -- Correct Harpoon v2 setup

-- Keybindings
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Harpoon: Add file" })
vim.keymap.set("n", "<leader>hm", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: Open menu" })

-- Jump between files
vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end, { desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end, { desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end, { desc = "Harpoon: Go to file 3" })
vim.keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end, { desc = "Harpoon: Go to file 4" })

-- Cycle through files
vim.keymap.set("n", "]", function()
	harpoon:list():next()
end, { desc = "Harpoon: Next file" })
vim.keymap.set("n", "[", function()
	harpoon:list():prev()
end, { desc = "Harpoon: Previous file" })
