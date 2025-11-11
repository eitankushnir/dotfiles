return {
    'saghen/blink.cmp',
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default"
        },

        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = { documentation = { auto_show = true } },
        snippets = { preset = 'luasnip' },

        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}
