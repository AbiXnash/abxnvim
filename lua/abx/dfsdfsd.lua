-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
vim.keymap.set("n", "<leader>cs", function()
	require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Pick Colorscheme" })
-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>sF", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "Search [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search Neovim files" })
