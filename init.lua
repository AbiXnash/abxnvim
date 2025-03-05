-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]

vim.opt.guicursor = "n-v-c:block,i:hor20"

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.wrap = false -- Disable visual line wrapping
vim.opt.textwidth = 0 -- Prevent automatic line breaks
vim.opt.formatoptions:remove("t") -- Disable automatic text wrapping when typing
vim.opt.formatoptions:remove("n") -- Prevent numbered list indentation

vim.opt.tabstop = 2 -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2 -- Number of spaces for indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.softtabstop = 2 -- Backspace treats 2 spaces as a tab
vim.opt.smartindent = true -- Auto-indent intelligently

-- [[ File Navigation with netrw ]]
--
local last_buffer = nil

vim.keymap.set("n", "<leader>e", function()
	local current_buf = vim.api.nvim_get_current_buf()

	-- If already in netrw or file explorer, switch back to last buffer
	if last_buffer and vim.bo.filetype == "netrw" then
		vim.api.nvim_set_current_buf(last_buffer)
		last_buffer = nil
	else
		-- Save current buffer before opening netrw
		last_buffer = current_buf
		vim.cmd("e .") -- Open the current directory
	end
end, { desc = "Toggle File Explorer" })

-- [[ File Navigation: Left and Right movement disable ]]

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "h", "<NOP>", { buffer = true })
		vim.keymap.set("n", "l", "<NOP>", { buffer = true })
	end,
})

-- [[ Basic Autocommands ]]

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--  You can press `?` in this menu for help. Use `:q` to close the window
--
require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	{ import = "default.plugins" },
	-- {import = "custom.keymaps"},
	{ import = "custom.plugins" },
	{ import = "custom.themes" },

	--
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
