return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {} -- Equivalent to setup({}) function
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {}
  }
}
