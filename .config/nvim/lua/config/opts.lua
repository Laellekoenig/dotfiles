vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"

local width = 2
vim.opt.tabstop = width
vim.opt.softtabstop = width
vim.opt.shiftwidth = width
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.showmode = false
