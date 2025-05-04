return {
    {
        "saghen/blink.cmp",
        dependencies = 'rafamadriz/friendly-snippets',
        version = "v0.*",
        opts = {
            keymap = {
                preset = "default",
                ['<Esc>'] = { 'hide' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            signature = { enabled = true, },
        },

        config = function(_, opts)
            require("blink.cmp").setup(opts)

            vim.keymap.set("i", "<CR>", function()
                local blink_cmp = require("blink.cmp")
                if blink_cmp.is_visible() then
                    blink_cmp.select_and_accept()
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true)
                end
            end, { desc = "Blink Smart Accept or Newline" })
        end
    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        config = true, -- Automatically enables the plugin
    }
}
