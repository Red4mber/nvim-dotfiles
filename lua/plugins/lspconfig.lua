return {
    {
        "neovim/nvim-lspconfig"
    },
    {
        "williamboman/mason.nvim",
        config = function() 
            require('mason').setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function() 
            require('mason-lspconfig').setup()
            require('mason-lspconfig').setup_handlers({
                -- Default handler
                function(lspname)
                    require("lspconfig")[lspname].setup({})
                end,
                -- Set up other LSPs here
            })
        end,
    },
}
