return {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
        require "startup".setup({

            header = {
                type = "text",
                align = "center",
                fold_section = false,
                title = "Header",
                margin = 0,
                content = require("startup.headers").hydra_header,
                highlight = "String",
                default_color = "#c25656",
                oldfiles_amount = 0,
            },
            header_2 = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Quote",
                margin = 0,
                content = require("startup.functions").quote(),
                highlight = "String",
                default_color = "",
                oldfiles_amount = 0,
            },
            body = {
                type = "mapping",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Basic Commands",
                margin = 0,
                content = {
                    { " Find File", "Telescope find_files", "<leader>ff" },
                    { "󰍉 Find Word", "Telescope live_grep", "<leader>lg" },
                    { " Recent Files", "Telescope oldfiles", "<leader>of" },
                    { " File Browser", "Telescope file_browser", "<leader>fb" },
                    { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
                    { " New File", "lua require'startup'.new_file()", "<leader>nf" },
                },
                highlight = "Constant",
                default_color = "",
                oldfiles_amount = 0,
            },
            options = {
                mapping_keys = true,
                cursor_column = 150,-- 0.5,
                empty_lines_between_mappings = true,
                disable_statuslines = true,
                paddings = { 3, 1, 1, 0 },
            },
            mappings = {
                execute_command = "<CR>",
                open_file = "o",
                open_file_split = "<c-o>",
                open_section = "<TAB>",
                open_help = "?",
            },
            colors = {
                background = "#161616",
                folded_section = "#c25656", --"#56b6c2",
            },
            parts = { "header", "header_2", "body" },
        })
    end
}
