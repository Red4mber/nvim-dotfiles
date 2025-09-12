return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "folke/lazydev.nvim"
        },
        config = function()
            require('lspconfig').lua_ls.setup({})
        end
    },
    -- LUA LS Setup 
    {
        "folke/lazydev.nvim",
        ft = "lua",
        -- optional = true,
        specs = {
            {
                'saghen/blink.cmp',
                opts = {
                    sources = {
                        providers = {
                            lazydev = {
                                enabled = false,
                                name = 'LazyDev',
                                module = 'lazydev.integrations.blink',
                                score_offset = 100,
                                fallbacks = {},
                            },
                        },
                        default = { 'lazydev' } },
                    },
                },
            },
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } }
                },
            },
        },
    }
