return {
	{
		"felipeagc/fleet-theme-nvim",
		-- priority = 1000, -- Ensures Fleet loads before other themes
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
