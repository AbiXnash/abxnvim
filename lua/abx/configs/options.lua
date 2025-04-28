-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd Font
vim.g.have_nerd_font = true

-- Cursor
vim.opt.guicursor = "n-v-c:block,i:hor20"

-- Line Number
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight Current Line
vim.opt.cursorline = true

-- Save Undo History
vim.opt.undofile = true

-- Disable backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Search Highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case-sensitive Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn on!
vim.opt.signcolumn = "yes"

-- Preview Substitutions, as you type!
vim.opt.inccommand = "split"

-- Scrolloff line
vim.opt.scrolloff = 20

-- Line wrap and breaking
vim.opt.wrap = false
vim.opt.textwidth = 0

-- Indentation setup
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Fast update time 
vim.opt.updatetime = 10

-- NETRW
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
