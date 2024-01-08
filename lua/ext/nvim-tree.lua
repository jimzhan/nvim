return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
--------------------------------------------------------------------------------
-- There are not real dependencies, I'm just lazy :-).
    'akinsho/bufferline.nvim',
    'nvim-lualine/lualine.nvim',
--------------------------------------------------------------------------------
    'nvim-tree/nvim-web-devicons',
  },

  keys = {
    { '<C-o>', ':NvimTreeToggle<CR>', desc = 'Toggle tree' },
  },

  config = function ()
    ----------------------------------------
    -- initialize status & buffer line
    require('bufferline').setup()
    require('lualine').setup()
    ----------------------------------------
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Make sure termguicolors are enabled. it's already enabled in options.lua
    vim.opt.termguicolors = true

    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_netrw = true,
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      filters = {
        dotfiles = true,
      },
      sort_by = 'case_sensitive',
      view = {
        adaptive_size = true,
      }
    }
  end
}
