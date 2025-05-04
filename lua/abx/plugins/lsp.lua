return {
    {
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

            require("lspconfig").svelte.setup {
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
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end
            })
        end
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("lint").linters_by_ft = {
                lua = { "selene" },
                sh = { "shellcheck" },
                python = { "mypy" },
                java = { "checkstyle" },
                typescript = { "eslint_d" },
                javascript = { "eslint_d" },
                js = { "eslint_d" },
                jsx = { "eslint_d" },
                svelte = { "eslint-D" },
            }
        end
    }
}
