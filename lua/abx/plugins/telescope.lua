return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = 'bottom_pane',
            },
            file_ignore_patterns = { "node_modules", ".git/" },
        })

        -- Goto ~/.config/nvim files
        vim.keymap.set("n", "<leader>vim", function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)

        -- Find Files from parent directory
        vim.keymap.set("n", "<leader>fd", function()
            require('telescope.builtin').find_files()
        end)

        -- Find words from parent directory
        vim.keymap.set("n", "<leader>fs", function()
            require('telescope.builtin').live_grep()
        end)

        -- Find git files
        vim.keymap.set("n", "<leader><leader>", function()
            require('telescope.builtin').git_files()
        end)

        -- Find by current buffers
        vim.keymap.set("n", "<leader>fb", function()
            require('telescope.builtin').buffers()
        end)

        -- LSP-based Code Actions
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function()
                vim.keymap.set("n", "gd", [[:lua pcall(vim.lsp.buf.definition)<CR>]], { noremap = true, silent = true })
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
                vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions)
                vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
                vim.keymap.set("x", "<leader>ca", vim.lsp.buf.code_action)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
            end
        })
    end



}
