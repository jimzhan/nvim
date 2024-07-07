local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-----------------------------
-- Neovim shortcuts
-----------------------------
vim.g.mapleader = ','
-----------------------------
-- Buffer (native)
-----------------------------
-- map('n', '<C-l>', ':bnext<CR>',     opts)
-- map('n', '<C-h>', ':bprevious<CR>', opts)
-- map('n', '<C-k>', ':bdelete<CR>',   opts)
-----------------------------
-- Buffer (for 'romgrk/barbar.nvim')
-- SEEALSO for default keymaps: https://github.com/romgrk/barbar.nvim
-----------------------------
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-k>', '<Cmd>BufferClose<CR>', opts)
