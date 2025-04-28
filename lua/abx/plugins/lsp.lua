return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			opts = {
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				}
			},
		},
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"lua_ls",
				},
			},
		},
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local servers = {}

		local lsp_dir = vim.fn.stdpath("config") .. "/lua/abx/lsp"
		local ok, files = pcall(vim.fn.readdir, lsp_dir)

		if ok then
			for _, file in ipairs(files) do
				if file:match("%.lua$") then
					local server_name = file:gsub("%.lua$", "")
					servers[server_name] = require("abx.lsp." .. server_name)
				end
			end
		end
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local opts = servers[server_name] or {}
				require("lspconfig")[server_name].setup(opts)
			end
		})
	end
}
