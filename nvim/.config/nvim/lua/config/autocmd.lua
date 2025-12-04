-- Highlight when yanking

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Hidden files search auto enabled when inside the dotfiles

vim.api.nvim_create_autocmd({ "BufNew", "BufEnter" }, {
    callback = function()
        local dotfiles_path = os.getenv("HOME") .. "/.dotfiles"
        if string.find(vim.fn.getcwd(), dotfiles_path) then
            vim.g.snacks_find_hidden = true
        else
            vim.g.snacks_find_hidden = false
        end
    end,
})

-- Auto theme change

vim.api.nvim_create_autocmd("Signal", {
    pattern = { "SIGUSR1" },
    group = vim.api.nvim_create_augroup("toggle_bg_on_SIGUSR1", {}),
    callback = function()
        local theme_path = os.getenv("HOME") .. '/.dotfiles/current/theme/neovim.theme'
        local theme_file = io.open(theme_path, "r")

        -- Default theme
        if not theme_file then
            vim.cmd.colorscheme("catppuccin")
            return
        end
        local theme = theme_file:read()
        theme_file:close()

        if not theme then
            vim.cmd.colorscheme("catppuccin")
            return
        end

        vim.cmd.colorscheme(theme)
        vim.cmd [[ TransparentEnable ]]
        vim.cmd [[ hi TreesitterContextBottom gui=underline ]]
        vim.cmd [[ hi TreesitterContextLineNumber guibg=none ]]
        vim.schedule(function()
            vim.cmd("redraw!")
        end)
    end,
    nested = true,
})

