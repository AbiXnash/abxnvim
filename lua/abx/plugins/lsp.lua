return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            registries = {
                'github:nvim-java/mason-registry',
                'github:mason-org/mason-registry',
            },
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            }
        },

        keys = {
            { "<leader>m", "<cmd>Mason<CR>" }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls" },
            automatic_enable = true,
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            -- Specific LSPs setup
            lspconfig["jdtls"].setup({
                capabilities = capabilities,
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "Java 24",
                                    path = "/usr/lib/jvm/default/",
                                    default = true,
                                }
                            }
                        }
                    }
                }
            })

            lspconfig.svelte.setup {
                filetypes = { "svelte" },
                on_attach = function(client, bufnr)
                    if client.name == 'svelte' then
                        vim.api.nvim_create_autocmd("BufWritePost", {
                            pattern = { "*.js", "*.ts", "*.svelte" },
                            callback = function(ctx)
                                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                            end,
                        })
                    end
                end
            }
        end
    }
}
