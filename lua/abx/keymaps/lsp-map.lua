local M = {}

function M.setup_keymaps(event)
	local opts = { buffer = event.buf, noremap = true, silent = true }

	-- LSP Keymaps
	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)
	vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts)
	vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
	vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	-- Check for inlay hint support and add keymap
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.supports_method("textDocument/inlayHint") then
		vim.keymap.set("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		end, opts)
	end
end

return M
