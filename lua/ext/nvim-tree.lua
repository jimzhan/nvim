return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  keys = {
    { '<C-o>', ':NvimTreeToggle<CR>', desc = 'Toggle tree' },
  },

  config = function ()
    ----------------------------------------
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    ----------------------------------------
    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_netrw = true,
      on_attach = function(buffer)
        require('nvim-tree.api').config.mappings.default_on_attach(buffer)
        ----------------------------------------
        -- fix native `M` movement in Vim.
        -- `M` in `nvim-tree`: Toggle Filter: No Bookmark |nvim-tree-api.tree.toggle_no_bookmark_filter()|
        ----------------------------------------
        vim.keymap.del('n', 'M', { buffer = buffer })
      end,
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
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {
          '.git',
        },
      },
      sort_by = 'case_sensitive',
      view = {
        adaptive_size = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '▸', -- arrow when folder is closed
              arrow_open = '▾', -- arrow when folder is open
            },
          },
        },
      }
    }
  end
}
