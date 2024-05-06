vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<C-o>:w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w>", "<CR>", { silent = true, noremap = true })
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu")
vim.cmd("set noshowmode")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- vim.keymap.set("n", "y", '"+y')
-- vim.keymap.set("n", "yy", '"+yy')
-- vim.keymap.set("n", "Y", '"+Y')
-- vim.keymap.set("n", "p", '"+p')
-- vim.keymap.set("n", "P", '"+P')
-- vim.keymap.set("x", "y", '"+y')
-- vim.keymap.set("x", "Y", '"+Y')
-- vim.keymap.set("x", "p", '"+p')
-- vim.keymap.set("x", "P", '"+P')
