

require('options')


-- Initialize Lazy.nvim 

local lazypath = vim.fn.stdpath('data') .. "lazy.lazy.nvim"
if not (vim.loop or vim.uv).fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none", "--branch=stable",
		"https://github.com/folke/lazy.nvim.git", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require('lazy').setup({
    spec = {
        { import = "plugins" },
    },
    checker = { enabled = true },
})
