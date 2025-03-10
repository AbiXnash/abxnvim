return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
		ft = { "java" }, -- Only load for Java files
		config = function()
			local jdtls = require("jdtls")

			-- Find the root of the project using Gradle/Maven/git
			local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
			local root_dir = require("jdtls.setup").find_root(root_markers)

			-- JDTLS Configuration
			local config = {
				cmd = { "jdtls" }, -- Ensure `jdtls` is installed
				root_dir = root_dir,
				settings = {
					java = {
						signatureHelp = { enabled = true },
						contentProvider = { preferred = "fernflower" }, -- Decompiler
					},
				},
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			}

			-- Start JDTLS
			jdtls.start_or_attach(config)
		end,
	},
}
