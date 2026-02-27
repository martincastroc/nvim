vim.g.mapleader = ' ' -- Space as leader key

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- Open Netrw

vim.keymap.set('n', '<Tab>', vim.cmd.bNext)

-- Keep cursor in the middle of the screen when jumping half-pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- Dont lose initial yank when pasting

-- Yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Make Ctrl-c equivalent to ESC for lsp/diagnostics on exiting insert mode.
vim.keymap.set("i", "<C-c>", "<Esc>")
