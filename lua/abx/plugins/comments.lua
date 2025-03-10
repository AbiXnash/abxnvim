return {
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})

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
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			-- Fix Treesitter's deprecated module
			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
}
