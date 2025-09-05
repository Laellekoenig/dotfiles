vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- sourcing file
vim.keymap.set("n", "<leader><leader>x", ":source %<cr>")
vim.keymap.set("n", "<leader>x", ":.lua<cr>")
vim.keymap.set("v", "<leader>x", ":lua<cr>")

-- splits
vim.keymap.set("n", "<leader>wh", ":split<cr>")
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>")
vim.keymap.set("n", "<leader>wd", ":close<cr>")
vim.keymap.set("n", "<leader>wm", ":only<cr>")
vim.keymap.set("n", "<leader>h", "<c-w>h<cr>")
vim.keymap.set("n", "<leader>j", "<c-w>j<cr>")
vim.keymap.set("n", "<leader>k", "<c-w>k<cr>")
vim.keymap.set("n", "<leader>l", "<c-w>l<cr>")

-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- center screen
vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "norm zz" })
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- move highlighted lines as block
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- copy pasting
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>d", '"_d')

-- don't continue comments on newlines
vim.api.nvim_create_autocmd({ "FileType" }, { command = "set formatoptions-=cro" })

-- quick fix
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>")
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>cprev<cr>")

-- diagnostics
vim.keymap.set("n", "<M-d>", "<cmd>lua vim.diagnostic.setqflist()<cr>")
vim.keymap.set("n", "<leader>fp", "<cmd>lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set("n", "<leader>fo", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
