return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {} -- Equivalent to setup({}) function
  },
  ------------------------------------------------------------
  -- Usage:
  --  1. Visual selection.
  --  2. <Leader>gc => line comment toggle.
  --  3. <Leader>gb => block comment toggle.
  ------------------------------------------------------------
  {
    'numToStr/Comment.nvim',
    lazy = false,

    config = function()
      require('Comment').setup()
    end
  },
  ------------------------------------------------------------
  -- Usage: `c` into change mode.
  ------------------------------------------------------------
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  }
}
