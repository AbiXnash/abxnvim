return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            opts = {
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                }
            },
        },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                ensure_installed = { "lua_ls", },
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
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end
        })
    end
}
