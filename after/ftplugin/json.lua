local has_new = vim.lsp and vim.lsp.config
local capabilities = vim.lsp.protocol.make_client_capabilities()

local json_opts = {
    filetypes = { "json", "jsonc" },
    capabilities = capabilities,
    settings = {
        json = {
            validate = { enable = true },
            schemas = require("schemastore").json.schemas(),
        },
    },
}

if has_new then
    vim.lsp.config("jsonls", json_opts)
    vim.lsp.enable({ "jsonls" })
else
    require("lspconfig").jsonls.setup(json_opts)
end
