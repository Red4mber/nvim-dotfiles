return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "folke/lazydev.nvim"
        },
        init = function()
		    local lspConfigPath = require("lazy.core.config").options.root .. "/nvim-lspconfig"
		    vim.opt.runtimepath:prepend(lspConfigPath)
	    end,
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
        {
            'mrcjkb/rustaceanvim',
            version = '^6', -- Recommended
            lazy = false, -- This plugin is already lazy
        }
    }
