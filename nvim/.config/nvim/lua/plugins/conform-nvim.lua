return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local conform = require('conform')

        conform.setup({
            formatters_by_ft = {
                python = { "ruff_format" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                javascript = { "biome" },
            }
        })


        vim.keymap.set({ "n", "v" }, "<leader>ff", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500
            })
        end, { desc = "Format current file" })
    end
}
