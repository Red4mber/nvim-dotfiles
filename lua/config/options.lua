

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Natural split direction
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tabs length
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Number of lines to show above/below cursor
vim.opt.scrolloff = 10

-- Use system clipboard
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- Enable virtual editing in block select mode
vim.opt.virtualedit = "block"

-- Disable line wraps
vim.opt.wrap = false

-- Better colors 
vim.opt.termguicolors = true

-- Case insensitive vim commands
vim.opt.ignorecase = true

-- Preview result of macros and substitutions
vim.opt.inccommand = "split"

-- https://neovim.io/doc/user/options.html#'winborder'
vim.opt.winborder = "rounded"
