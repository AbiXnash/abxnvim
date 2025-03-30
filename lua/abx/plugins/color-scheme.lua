-- return {
-- }

return {
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1001, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				-- ...
			})

			-- vim.cmd("colorscheme github_dark")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main", -- or "moon" / "dawn"
				disable_background = true, -- optional
			})
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", blend = 100 }) -- Makes the border area transparent
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" }) -- Matches floating window background
			vim.api.nvim_set_hl(0, "HarpoonBorder", { bg = "NONE", blend = 100 }) -- Ensures Harpoon border is transparent
			vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", blend = 100 }) -- Removes background color from window separators
			-- vim.cmd("colorscheme rose-pine")
			vim.schedule(function()
				-- General highlights
				local highlights = {
					"Normal",
					"NormalNC",
					"EndOfBuffer",
					"SignColumn",
					"LineNr",
					"Folded",
					"TelescopeNormal",
					"TelescopeBorder",
					"TelescopePromptNormal",
					"TelescopePromptBorder",
					"TelescopeResultsNormal",
					"TelescopeResultsBorder",
					"TelescopePreviewNormal",
					"TelescopePreviewBorder",
					"HarpoonWindow",
					"HarpoonBorder",
					"HarpoonNormal",
					"HarpoonNormalNC",
					"NormalFloat",
				}
				for _, hl in ipairs(highlights) do
					vim.cmd("highlight " .. hl .. " guibg=#000000")
				end
			end)
		end,
	},
	{
		"felipeagc/fleet-theme-nvim",
		priority = 1000, -- Ensures Fleet loads before other themes
		config = function()
			vim.cmd("colorscheme fleet") -- Load the Fleet theme

			vim.schedule(function()
				-- Delay to override highlights after theme applies
				local highlights = {
					"Normal",
					"NormalNC",
					"EndOfBuffer",
					"SignColumn",
					"LineNr",
					"Folded",
				}
				for _, hl in ipairs(highlights) do
					vim.cmd("highlight " .. hl .. " guibg=#000000")
				end
			end)
		end,
	},
}
