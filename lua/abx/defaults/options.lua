-- Leader Key!
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd Font stuff
vim.g.have_nerd_font = true

-- Cursor
vim.opt.guicursor = "n-v-c:block,i:hor20"

-- Line Number
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight Current Line
vim.opt.cursorline = true

-- Default clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Save Undo History
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Search Highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Case-Sensitive search
-- unless \C or one or more capital terms in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn, yes
vim.opt.signcolumn = "yes"

-- Split screens
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview Substitutions live, as you type!
vim.opt.inccommand = "split"

-- Scroll off Line
vim.opt.scrolloff = 20

-- Line wrap and breaking
vim.opt.wrap = false
vim.opt.textwidth = 0

vim.opt.formatoptions:remove("t") -- Disable automatic text wrapping when typing
vim.opt.formatoptions:remove("n") -- Prevent numbered list indentation

-- Indent Guide
vim.opt.tabstop = 2 -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2 -- Number of spaces for indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.softtabstop = 2 -- Backspace treats 2 spaces as a tab
vim.opt.smartindent = true -- Auto-indent intelligently

-- Fast Update Time
vim.opt.updatetime = 50

-- NETRW
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
