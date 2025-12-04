return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            -- transparent = true,
        },
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -- lua/plugins/rose-pine.lua
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require('everforest').setup(({}))
        end
    },
    -- Using lazy.nvim
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup {}
            require('bamboo').load()
        end,
    },
    -- {
    --     "bjarneo/pixel.nvim",
    --     priority = 1000,
    --     opts = {},
    -- },
}
