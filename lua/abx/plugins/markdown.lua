return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	-- Markdown Syntax Highlighting & Concealment
	{
		"plasticboy/vim-markdown",
		ft = "markdown",
		config = function()
			vim.g.vim_markdown_conceal = 1 -- Enable conceal feature
			vim.g.vim_markdown_conceal_code_blocks = 0 -- Show code blocks normally
		end,
	},

	-- Beautiful Headings for Markdown
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("headlines").setup({
				markdown = {
					headline_highlights = { "Headline1", "Headline2", "Headline3" },
				},
			})
			-- Define colors for headers
			vim.cmd([[
                highlight Headline1 guifg=#ff5f5f gui=bold
                highlight Headline2 guifg=#5fafff gui=bold
                highlight Headline3 guifg=#afff5f gui=bold
            ]])
		end,
	},

	-- Treesitter for Markdown Syntax Highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "markdown", "markdown_inline" },
			highlight = { enable = true },
		},
	},
}
