return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim", 
        "nvim-telescope/telescope-fzf-native.nvim"
    },
    keys = {
        {
            "<leader>ff",
            function() require('telescope.builtin').find_files() end,
            desc = "Find Files"
        },
        {
            "<leader>fh",
            function() require('telescope.builtin').help_tags() end,
            desc = "Help Pages"
        },
        {
            "<leader>fb",
            function() require('telescope.builtin').buffers() end,
            desc = "Buffers"
        },
        {
            "<leader>fg",
            function() require('telescope.builtin').live_grep() end,
            desc = "Live Grep"
        },
        {
            "<leader>fd",
            function() require('telescope.builtin').diagnostics() end,
            desc = "Diagnostics"
        },
    },
}
