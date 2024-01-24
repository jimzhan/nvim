local map = vim.keymap.set
local defaults = { noremap = true, silent = true }
-----------------------------
-- Neovim shortcuts
-----------------------------
vim.g.mapleader = ','
-----------------------------
-- Buffer
-----------------------------
map('n', '<C-l>', ':bnext<CR>',     defaults)
map('n', '<C-h>', ':bprevious<CR>', defaults)
map('n', '<C-k>', ':bdelete<CR>',   defaults)

