return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"diff",

				-- 🌍 Web Development
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"yaml",

				-- 💻 Backend Development
				"java",
				"kotlin",
				"bash",
				"dockerfile",

				-- ⚡ Frameworks & Tools
				"gitignore",
				"gitcommit",
				"gitattributes",

				-- 🌱 Spring Boot Related
				"xml",
				"toml",
				"yaml",
				"json",

				-- 🐍 General Purpose Languages
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"python",
				"markdown",
				"markdown_inline",

				-- 🛢️ Databases
				"sql",
				"json",
				"yaml",
				"toml",

				-- 📁 Dotfiles & Configs
				"gitignore",
				"bash",
				"make",
				"ini",

				-- 🔍 Miscellaneous
				"query",
				"regex",
				"comment",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},
}
