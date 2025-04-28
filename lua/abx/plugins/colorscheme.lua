return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,

        opts = {
            variant = "main",
            disable_background = true,
        },

        init = function()
            vim.cmd([[colorscheme rose-pine]])

            --  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", blend = 100 })   -- Makes the border area transparent
            --  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })             -- Matches floating window background
            vim.api.nvim_set_hl(0, "HarpoonBorder", { bg = "NONE", blend = 100 }) -- Ensures Harpoon border is transparent
            vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", blend = 100 })  -- Removes background color from window separators

            vim.schedule(function()
                local highlights = {
                    --  "Normal",
                    --  "NormalNC",
                    --  "EndOfBuffer",
                    --  "SignColumn",
                    --  "LineNr",
                    --  "Folded",
                    "TelescopeNormal",
                    "TelescopeBorder",
                    "TelescopePromptNormal",
                    "TelescopePromptBorder",
                    "TelescopeResultsNormal",
                    "TelescopeResultsBorder",
                    "TelescopePreviewNormal",
                    "TelescopePreviewBorder",
                    "HarpoonWindow",
                    "HarpoonBorder",
                    "HarpoonNormal",
                    "HarpoonNormalNC",
                    --  "NormalFloat",
                }
                for _, hl in ipairs(highlights) do
                    vim.cmd("highlight " .. hl .. " guibg=#000000")
                end
            end)
        end,
    },
    { "felipeagc/fleet-theme-nvim" }
}
