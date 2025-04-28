return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,

		opts = {
			variant = "main",
			disable_background = true,
		},

		init = function()
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{"felipeagc/fleet-theme-nvim"}
}
