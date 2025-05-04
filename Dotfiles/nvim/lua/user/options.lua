print("Hello, Welcome ! ")

--(all thanks to: Understanding Neovim by: Vhyrro)

vim.opt.relativenumber = true

--Fix how to open windows
vim.opt.splitbelow = true
vim.opt.splitright  = true

--Disable line wrap
vim.opt.wrap = false

--converting tabs to spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


--Clipboard sync with system
vim.opt.clipboard = "unnamedplus"

--Fix cursor position while scrolling
vim.opt.scrolloff = 999

--Visual mode mod (virtual edit)
vim.opt.virtualedit = "block"

--Window split fro global changes
vim.opt.inccommand = "split"

--Ignoring nvim casing rules
vim.opt.ignorecase = true

--Expand terminal color support
vim.opt.termguicolors = true

--Leader key
vim.g.mapleader = " "




