return {
	-- Custom formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			local null_ls = require("null-ls")

			return {
				sources = {
					null_ls.builtins.formatting.prettierd.with({
						disabled_filetype = { "html" },
					}), -- Prettier daemon for better performance
					null_ls.builtins.formatting.black,
				},
				on_attach = function(client, bufnr)
					local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

					-- if client.name == "null-ls" and (ft == "html" or ft == "css") then
					-- 	vim.schedule(function()
					-- 		vim.lsp.buf_detach_client(bufnr, client.id)
					-- 	end)
					-- 	return
					-- end
					if client.supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			}
		end,
	},
}
