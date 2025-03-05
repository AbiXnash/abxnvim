return {
	-- Rosé Pine for UI
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				disable_background = true, -- Keep transparency
			})
			vim.cmd("colorscheme rose-pine") -- Ensure Rosé Pine loads first
		end,
	},
}
