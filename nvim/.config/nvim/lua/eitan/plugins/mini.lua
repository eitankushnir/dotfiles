return {
    {
        'echasnovski/mini.nvim',
        dependencies = {
            'echasnovski/mini.statusline',
            'echasnovski/mini.icons',
            'echasnovski/mini.pairs',
        },
        config = function()
            local statusline = require('mini.statusline')
            require('mini.pairs').setup {}
            -- statusline.setup { use_icons = true }
            -- vim.cmd([[ hi MiniStatuslineFilename guifg=#ebdbb2 guibg=#504945 ]])
        end
    },
}
