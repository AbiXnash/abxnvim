return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = true,
	keys = { -- load the plugin only when using it's keybinding:
		{ "<leader>U", "<cmd>Undo Tree<cr>", desc = "Undo Tree" },
	},
}
