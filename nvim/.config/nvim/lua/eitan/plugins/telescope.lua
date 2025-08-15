return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
        require("telescope").setup {
            extensions = {
                fzf = {}
            }
        }
        require("telescope").load_extension("fzf")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<C-p>', builtin.git_files)
        vim.keymap.set('n', '<leader>fws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>fWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags)
        vim.keymap.set('n', '<leader>en', function()
            local conf = vim.fn.stdpath("config")
            builtin.find_files({ cwd = conf })
        end)
        vim.keymap.set('n', '<leader>eh', function()
            local hyprconf = "$HOME/.config/hypr"
            builtin.find_files({ cwd = hyprconf });
        end)
        vim.keymap.set('n', '<C-F12>', function()
            builtin.lsp_document_symbols({ symbols = 'function' })
        end)

        require("eitan.configs.telescope-multigrep").setup()
    end
}
