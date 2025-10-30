return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                "lua",
                "hyprland",
                "c",
                "cpp",
                "python",
            },
        },
        config = function(_, opts)
            -- Start treesitter for languages specified in opts.ensure_installed
            if opts.ensure_installed and #opts.ensure_installed > 0 then
                require('nvim-treesitter').install(opts.ensure_installed)
                for _, parser in ipairs(opts.ensure_installed) do
                    local filetypes = parser
                    vim.treesitter.language.register(parser, filetypes)

                    vim.api.nvim_create_autocmd({ "Filetype" }, {
                        pattern = filetypes,
                        callback = function(event)
                            vim.treesitter.start(event.buf, parser)
                        end
                    })
                end
            end
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufRead",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
        },
        opts = {
            multiwindow = true,
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
            keys = {
                {
                    "af",
                    function()
                        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
                    end,
                    desc = "Select outer function",
                    mode = { "x", "o" },
                },
                {
                    "if",
                    function()
                        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
                    end,
                    desc = "Select inner function",
                    mode = { "x", "o" },
                },
                {
                    "ac",
                    function()
                        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
                    end,
                    desc = "Select outer class",
                    mode = { "x", "o" },
                },
                {
                    "ic",
                    function()
                        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
                    end,
                    desc = "Select inner class",
                    mode = { "x", "o" },
                },
                {
                    "as",
                    function()
                        require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
                    end,
                    desc = "Select local scope",
                    mode = { "x", "o" },
                },
            },
            ---@module "nvim-treesitter-textobjects"
            opts = { multiwindow = true },
        },
    },
}
