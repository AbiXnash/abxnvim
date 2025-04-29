return {
    { "folke/todo-comments.nvim",           opts = {} },
    {
        "mbbill/undotree",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>U", vim.cmd.UndotreeToggle }
        }
    },
    { 'brenoprata10/nvim-highlight-colors', opts = {} }
}
