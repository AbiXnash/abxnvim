-- [[ File Navigation with netrw ]]

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
