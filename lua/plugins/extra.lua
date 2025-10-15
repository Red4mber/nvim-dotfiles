return {
    -- Add surrounding parentheses, brackets, quotes, etc. with ease
    {"tpope/vim-surround"},

    -- Automatically set buffer options like 'shiftwidth' and 'expandtab'
    {"tpope/vim-sleuth"},

    -- Commenting plugin 
    {'numToStr/Comment.nvim'},

    -- Highlight special comments like TODO, FIXME, etc.
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    }

}