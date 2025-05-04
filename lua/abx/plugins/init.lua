return {
    {
        "mbbill/undotree",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>U", vim.cmd.UndotreeToggle }
        }
    },
    { 'brenoprata10/nvim-highlight-colors', opts = {} },

    -- JSON
    { "b0o/schemastore.nvim" },

    -- Git
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim",            opts = {} }
}
