return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "RRethy/base16-nvim", "folke/trouble.nvim" },

	config = function()
		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			hl_group = "lualine_c_normal",
		})

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
					-- { symbols.get, cond = symbols.has },
				},
				lualine_x = {
					"filetype",
					function()
						local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
						if next(buf_clients) == nil then
							return " "
						end
						local clients = {}
						for _, client in pairs(buf_clients) do
							table.insert(clients, client.name)
						end
						return table.concat(clients, ", ")
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
