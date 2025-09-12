return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    version = '1.*',
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'enter' },

        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = {
            documentation = {
                auto_show = true,
                window = { border = 'single' }
            },
            ghost_text = { enabled = true },
        },

        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer'
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

    },
    opts_extend = { "sources.default" }
}
