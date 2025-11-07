return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@module "snacks"
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            indent = { enabled = true },
            picker = {
                matcher = {
                    frecency = true,
                },
                win = {
                    input = {
                        keys = {
                            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
                            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
                            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
                        },
                    },
                },
            },
        },
        keys = {
            --Picker Keybindings
            { "<leader><space>", function() Snacks.picker.files() end,      desc = "Find Files" },
            {
                "<leader>fb",
                function()
                    Snacks.picker.buffers({
                        on_show = function() vim.cmd.stopinsert() end,
                        finder = "buffers",
                        format = "buffer",
                        hidden = false,
                        unloaded = true,
                        current = true,
                        sort_lastused = true,
                        win = {
                            input = {
                                keys = {
                                    ["d"] = { "bufdelete", mode = { "n", "i" } },
                                },
                            },
                            list = { keys = { ["d"] = "bufdelete" } },
                        },
                    })
                end
            },
            { "<C-f>",           function() Snacks.picker.grep() end,       desc = "Find grep" },
            { "<leader>e",       function() Snacks.picker.explorer() end,   desc = "Open explorer" },
            { "<M-h>",           function() Snacks.picker.highlights() end, desc = "Show Highlight groups" },
            {
                "<M-b>",
                function()
                    Snacks.picker.git_branches({
                        layout = "select",
                    })
                end,
                desc = "Branches",
            },
            -- Used in LazyVim to view the different keymaps, this by default is
            -- configured as <leader>sk but I run it too often
            -- Sometimes I need to see if a keymap is already taken or not
            {
                "<M-k>",
                function()
                    Snacks.picker.keymaps({
                        layout = "vertical",
                    })
                end,
                desc = "Keymaps",
            },
        }
    }
}
