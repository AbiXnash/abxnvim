return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	opts = function()
		return require("null-ls")
	end,
}
