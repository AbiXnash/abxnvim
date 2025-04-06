-- [[ File Navigation: Left and Right movement disable ]]

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "h", "<NOP>", { buffer = true })
		vim.keymap.set("n", "l", "<NOP>", { buffer = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt.textwidth = 80 -- Wrap text at 80 characters
		vim.opt.formatoptions:append("t") -- Auto-wrap while typing
	end,
})

-- HTML Template
vim.api.nvim_create_user_command("HtmlTemplate", function()
	local lines = {
		"<!DOCTYPE html>",
		'<html lang="en">',
		"<head>",
		'  <meta charset="UTF-8" />',
		'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
		"  <title>Document</title>",
		"</head>",
		"<body>",
		"",
		"</body>",
		"</html>",
	}
	vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
end, {})

-- For HTML files only
vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
