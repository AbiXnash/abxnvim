return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()

		-- Keybindings
		vim.keymap.set("n", "<leader>/", function()
			return require("Comment.api").call(
				"toggle.linewise." .. (vim.v.count == 0 and "current" or "count_repeat"),
				"g@$"
			)()
		end, { expr = true, silent = true, desc = "Toggle comment line" })

		vim.keymap.set(
			"x",
			"<leader>/",
			"<Esc><Cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>",
			{ desc = "Toggle comment (visual)" }
		)
	end,
}
