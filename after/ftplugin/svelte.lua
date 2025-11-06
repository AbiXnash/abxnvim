local has_new = vim.lsp and vim.lsp.config
local capabilities = vim.lsp.protocol.make_client_capabilities()

local svelte_opts = {
    filetypes = { "svelte" },
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        if client.name == "svelte" then
            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts", "*.svelte" },
                callback = function(ctx)
                    client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                end,
            })
        end
    end,
}

if has_new then
    vim.lsp.config("svelte", svelte_opts)
    vim.lsp.enable({ "svelte" })
else
    require("lspconfig").svelte.setup(svelte_opts)
end
