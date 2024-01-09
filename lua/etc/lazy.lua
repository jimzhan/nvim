-----------------------------
-- Lazy Plugin Manager
-----------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Set up plugins under `ext` folder.
require 'lazy'.setup({
  { import = 'ext' },
  { import = 'themes.tokyonight' }
})

