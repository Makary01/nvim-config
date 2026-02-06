vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<C-c>", "\"+y")
vim.keymap.set("n", "<C-c>", "\"+y")

vim.keymap.set("n", "<C-z>", "<Nop>", { silent = true })
vim.keymap.set("n", "Q", "<Nop>", { silent = true })
