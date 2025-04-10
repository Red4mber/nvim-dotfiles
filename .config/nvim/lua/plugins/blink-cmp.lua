return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = { documentation = { auto_show = false } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        servers = {
            lua_ls = {},
            rust_analyzer = {},
        },

        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
        local lspconfig = require('lspconfig')
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end


}
