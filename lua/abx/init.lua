local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "http://github.com/folke/lazy.nvim.git"
	local _ = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{"Failed to clone!!\n", "ErrorMsg"},
			{"out", "WarningMsg"},
			{"\nPress any key to exit..."},
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("abx.configs.options")
require("abx.configs.remaps")
require("abx.configs.autocmd")

require("lazy").setup({
	spec = {
		{import = "abx.plugins"}
	},
	checker = {enabled = true},
	change_detection = { notify = false },
})
