
-- Clangd configuration for Neovim LSP
return {
    cmd = { "clangd" },
    root_markers = { ".git", "compile_commands.json", "build.ninja" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    settings = {
        ["clangd"] = {
            check = {
                command = "clang-tidy" ,
            },
            diagnostics = {
                enable = true,
            },
        },
    },
}