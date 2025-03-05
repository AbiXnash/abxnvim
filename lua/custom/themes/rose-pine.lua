return {
	-- Fleet for syntax highlighting
	{
		"felipeagc/fleet-theme-nvim",
		name = "fleet",
		lazy = false,
		priority = 1000,
		config = function()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "rose-pine",
				callback = function()
					vim.cmd("colorscheme fleet") -- Apply Fleet syntax
				end,
			})
		end,
	},
}
