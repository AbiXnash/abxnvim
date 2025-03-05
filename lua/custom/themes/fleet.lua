return {
	{
		"felipeagc/fleet-theme-nvim",
		config = function()
			vim.cmd("colorscheme fleet") -- Load the theme

			-- Delay to override after theme applies
			vim.schedule(function()
				vim.cmd("highlight Normal guibg=#000000")
				vim.cmd("highlight NormalNC guibg=#000000")
				vim.cmd("highlight EndOfBuffer guibg=#000000")
				vim.cmd("highlight SignColumn guibg=#000000")
				vim.cmd("highlight LineNr guibg=#000000")
				vim.cmd("highlight Folded guibg=#000000")
			end)
		end,
	},
}
