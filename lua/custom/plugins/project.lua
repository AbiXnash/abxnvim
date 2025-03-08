return {
	{
		"ahmedkhalf/project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("project_nvim").setup({
				manual_mode = false, -- Automatically detect projects
				detection_methods = { "lsp", "pattern" },
				patterns = { ".project", ".git", "Makefile", "package.json", "gradlew", ".env" },
			})
			require("telescope").load_extension("projects")
		end,
	},
}
