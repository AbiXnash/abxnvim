return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },

    keys = {
        -- Goto ~/.config/nvim files
        { "<leader>vim", function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath("config")
            }
        end },

        -- Find Files from parent directory
        { "<leader>fd",       require('telescope.builtin').find_files },

        -- Find words from parent directory
        { "<leader>fs",       require('telescope.builtin').live_grep },

        -- Find git files
        { "<leader><leader>", require('telescope.builtin').git_files },

    }
}
