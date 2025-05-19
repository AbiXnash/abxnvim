return {
    {
        "mason-org/mason.nvim",
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
        "mason-org/mason-lspconfig.nvim",
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
        dependencies = { "j-hui/fidget.nvim", opts = {} },
        config = function()
            local lspconfig = require('lspconfig')
            local servers = require("mason-lspconfig").get_installed_servers()

            -- Specific LSPs setup
            lspconfig["jdtls"].setup({
                capabilities = capabilities,
            })
            for _, server in ipairs(servers) do
                lspconfig[server].setup {}
            end
        end
    }
}
