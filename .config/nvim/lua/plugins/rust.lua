return {
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
        keys = {
            {
                "<Leader>rr",
                function() vim.cmd.RustLsp { 'explainError', 'cycle' } end,
                desc = "Explain errors"
            },
            {
                "<Leader>ro",
                function() vim.cmd.RustLsp { 'openDocs' } end,
                desc = "Open docs.rs"
            },
            {
                "<Leader>a",
                function() vim.cmd.RustLsp { 'hover', 'actions' } end,
                desc = "Hover actions"
            },

        },
    },
    {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
        require('crates').setup()
    end,
}
}
