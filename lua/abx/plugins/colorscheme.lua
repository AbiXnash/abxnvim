return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,

        opts = {
            variant = "main",
            disable_background = true,
            palette = {
                main = {
                    _nc = "#121212",
                    base = "#1a1b26",
                    surface = "#2c2e34",
                    --overlay = "#22222e",
                    --muted = "#5a5c68",
                    --                   subtle = "#888888",
                    love = "#d16d92",
                    gold = "#CA9F7C",
                    pine = "#5d7e80",
                    --                    highlight_low = "#292e42",
                    --                   highlight_med = "#3b4261",
                    --                   highlight_high = "#565f89",
                }
            }
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
