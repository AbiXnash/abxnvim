return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			options = {
				linebreak = true,
				breakindent = true,
				wrap = true,
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
