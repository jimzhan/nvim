return {
  'folke/todo-comments.nvim',
  event = "BufRead",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require('todo-comments').setup()
  end
}
