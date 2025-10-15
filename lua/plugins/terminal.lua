return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require('toggleterm').setup({
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = false,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = '1',
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'float',
        })

        -- create a lazygit terminal instance and expose a global toggle function
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            close_on_exit = true,
            float_opts = {
                border = 'rounded',
            },
        })

        local function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.keymap.set('n', '<leader>tg', _lazygit_toggle, {
            noremap = true,
            silent = true,
            desc = "Toggle lazygit"
        })
    end,
    keys = {
        -- {
        --     "<leader>tt",
        --     "<cmd>ToggleTerm direction=float<cr>",
        --     desc = "Toggles floating terminal"
        -- },
        {
            "<leader>tg",
            "<cmd>lua _lazygit_toggle()<CR>",
            desc = "Toggles lazygit terminal"
        }
    }
}
