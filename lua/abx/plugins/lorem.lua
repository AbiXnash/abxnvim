return {
	"derektata/lorem.nvim",
	cmd = { "Lorem" },
	config = function()
		require("lorem").setup()
	end,
}
