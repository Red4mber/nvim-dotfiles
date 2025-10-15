return {
    'romgrk/barbar.nvim',
    lazy = false,
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
        -- insert_at_start = true,
        auto_hide = false
        -- …etc.
    },
    keys = {
        { "<leader><left>",     "<cmd>BufferPrevious<cr>",      desc = "Previous Buffer"    },
        { "<leader><right>",    "<cmd>BufferNext<cr>",          desc = "Next Buffer"        },
    --     { "<C-PageUp>",         "<cmd>BufferNext<cr>",          desc = "Next buffer"        },
    --     { "<C-PageDown>",       "<cmd>BufferPrevious<cr>",      desc = "Previous buffer"    },
    --     -- { "<leader>1",          "<cmd>BufferGoto 1<cr>",        desc = "Go to buffer 1"     },
    --     -- { "<leader>2",          "<cmd>BufferGoto 2<cr>",        desc = "Go to buffer 2"     },
    --     -- { "<leader>3",          "<cmd>BufferGoto 3<cr>",        desc = "Go to buffer 3"     },
    --     -- { "<leader>4",          "<cmd>BufferGoto 4<cr>",        desc = "Go to buffer 4"     },
    --     -- { "<leader>5",          "<cmd>BufferGoto 5<cr>",        desc = "Go to buffer 5"     },
    --     -- { "<leader>6",          "<cmd>BufferGoto 6<cr>",        desc = "Go to buffer 6"     },
    --     -- { "<leader>7",          "<cmd>BufferGoto 7<cr>",        desc = "Go to buffer 7"     },
    --     -- { "<leader>8",          "<cmd>BufferGoto 8<cr>",        desc = "Go to buffer 8"     },
    --     -- { "<leader>9",          "<cmd>BufferGoto 9<cr>",        desc = "Go to buffer 9"     },
    --     -- { "<leader>0",          "<cmd>BufferLast<cr>",          desc = "Go to last buffer"  },
    },
}
