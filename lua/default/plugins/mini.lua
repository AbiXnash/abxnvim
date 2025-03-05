return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
			require("mini.starter").setup({
				evaluate_single = true,
				header = table.concat({
					" █████╗   ███████╗    ██╗  ██╗              Z",
					"██╔══██╗   ██╔══██╗   ╚██╗██╔╝           Z",
					"███████║   ██████╔╝    ╚███╔╝           z   ",
					"██╔══██║   ██╔══██╗    ██╔██╗   ╔══╗     z  ",
					"██║  ██║  ███████╔╝   ██╔╝ ██╗  ║██║ ",
					"╚═╝  ╚═╝   ╚═════╝    ╚═╝  ╚═╝  ╚══╝",
				}, "\n"),
				items = {
					{ name = "Find file", action = "Telescope find_files", section = "Telescope" },
					{ name = "New file", action = "ene | startinsert", section = "Built-in" },
					{ name = "Recent files", action = "Telescope oldfiles", section = "Telescope" },
					{ name = "Find text", action = "Telescope live_grep", section = "Telescope" },
					{
						name = "Config",
						action = "Telescope find_files cwd=~/.config/nvim",
						section = "Config",
					},

					{
						name = "Restore session",
						action = function()
							local ok, persistence = pcall(require, "persistence")
							if ok then
								persistence.load()
							else
								print("persistence.nvim is not installed!")
							end
						end,
						section = "Session",
					},
					{ name = "Lazy", action = "Lazy", section = "Config" },
					{ name = "Quit", action = "qa", section = "Built-in" },
				},
				content_hooks = {
					require("mini.starter").gen_hook.adding_bullet("  ░ ", false),
					require("mini.starter").gen_hook.aligning("center", "center"),
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				end,
			})
			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
