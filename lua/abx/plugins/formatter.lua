return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local nls = require("null-ls")
            local fmt = nls.builtins.formatting
            local dgn = nls.builtins.diagnostics
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            nls.setup({
                sources = {
                    fmt.google_java_format.with({ extra_args = { "--aosp" } }),
                    dgn.checkstyle.with({
                        extra_args = {
                            "-c",
                            vim.fn.expand("~/.config/nvim/after/formatter/google-check.xml"),
                        },
                    }),
                    fmt.prettierd.with({
                        filetypes = {
                            "javascript", "typescript", "javascriptreact", "typescriptreact",
                            "json", "jsonc", "yaml", "html", "css", "scss", "markdown", "graphql",
                        },
                        extra_args = { "--trailing-comma", "none" }
                    }),
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
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
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        opt = {
            ensure_installed = {
                "checkstyle",
                "google-java-format",
            },
        },
    },
}
