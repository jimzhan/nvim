-- Usage:
--  1. Visual selection.
--  2. <Leader>gc => line comment toggle.
--  3. <Leader>gb => block comment toggle.
return {
  'numToStr/Comment.nvim',
  lazy = false,

  config = function()
    require('Comment').setup()
  end
}
