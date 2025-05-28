return {
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     --	config = function()
    --     --		vim.cmd("colorscheme rose-pine")
    --     --	end
    -- },
    --    {
    --        "luisiacc/gruvbox-baby",
    --        lazy = false,
    --        setup = {},
    --
    --        config = function()
    --            vim.o.termguicolors = true
    --            vim.g.gruvbox_baby_background_color = "dark"
    --            vim.cmd [[ colorscheme gruvbox-baby ]]
    --        end
    --    }
    {
        'uZer/pywal16.nvim',
        -- for local dev replace with:
        -- dir = '~/your/path/pywal16.nvim',
        config = function()
            local pywal16 = require('pywal16')

            pywal16.setup()
            vim.cmd.colorscheme("pywal16")
        end,
    }
}
