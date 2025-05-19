return {
    {
        "mbbill/undotree",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>U", vim.cmd.UndotreeToggle }
        }
    },
    {
        "mistricky/codesnap.nvim",
        build = "make",
        keys = {
            { "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
            { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
        },
        opts = {
            save_path = "~/Pictures",
            has_breadcrumbs = true,
            watermark = "CodeSnap.nvim",
            bg_theme = "bamboo",
        },
    },

    { 'jinh0/eyeliner.nvim',                opts = { highlight_on_key = true, } },

    -- Git
    { "lewis6991/gitsigns.nvim", },
    { "tpope/vim-fugitive" },

    -- CSS
    { 'brenoprata10/nvim-highlight-colors', opts = {} },

    -- JSON
    { "b0o/schemastore.nvim" },

    -- Presentaion
    { 'tjdevries/present.nvim' },
}
