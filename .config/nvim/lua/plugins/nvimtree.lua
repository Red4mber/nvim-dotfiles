return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {
        'mikew/nvim-drawer',
        opts = {},
        config = function(_, opts)
            local drawer = require('nvim-drawer')
            drawer.setup(opts)

            drawer.create_drawer({
                nvim_tree_hack = true,
                position = 'left',
                size = 20,
                    on_vim_enter = function(event)
                        -- event.instance.open({
                        --     focus = false,
                        -- })

                        vim.keymap.set('n', '<leader>e', function()
                            event.instance.focus_or_toggle()
                        end, {desc="Toggle NvimTree"})
                    end,

                    on_did_create_buffer = function()
                        local nvim_tree_api = require('nvim-tree.api')
                        nvim_tree_api.tree.open({ current_window = true })
                    end,

                    on_did_open = function()
                        local nvim_tree_api = require('nvim-tree.api')
                        nvim_tree_api.tree.reload()

                        vim.opt_local.number = false
                        vim.opt_local.signcolumn = 'no'
                        vim.opt_local.statuscolumn = ''
                    end,

                    on_did_close = function()
                        local nvim_tree_api = require('nvim-tree.api')
                        nvim_tree_api.tree.close()
                    end,
                })
            end
        }
    }

