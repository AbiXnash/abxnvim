return {
    "neovim/nvim-lspconfig",
    dependencies = {
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
                ensure_installed = { "lua_ls", "jdtls", },
            },
        },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, },
            },
        },
    },

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Setup Java LSP server (jdtls)
        require("lspconfig")["jdtls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "Java 23",
                                path = "/usr/lib/jvm/java-21-openjdk/bin",
                                default = true,
                            }
                        }
                    }
                }
            }
        })

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({ capabilities = capabilities })
            end
        })
    end
}
