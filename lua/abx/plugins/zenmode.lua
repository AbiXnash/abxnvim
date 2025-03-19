return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			options = {
				number = false,
				relativenumber = false,
			},
		},
		plugins = {
			kitty = {
				enabled = true,
				font = "+3",
			},
			gitsigns = {
				enabled = true,
			},
		},
	},
}
