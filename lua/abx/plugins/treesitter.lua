return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            modules = {},
            ignore_install = {},

            ensure_installed = { "lua", "vimdoc", "java" },

            sync_install = false,
            auto_install = false,

            highlight = {
                enable = true,
                -- disable = {},
                disable = function(_, buf)
                    local max_size = 100 * 1024
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

                    if ok and stats and stats.size > max_size then
                        print("File size is too big to parse using Treesitter")
                        return true
                    end
                end
            },
            indent = { enable = true },

            additional_vim_regex_highlighting = true,
        })
    end
}
