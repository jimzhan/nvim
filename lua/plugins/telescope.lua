return {
  'nvim-telescope/telescope.nvim',
  dependencies = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  config = function()
    require'telescope'.setup{}

    local options = {noremap = true, silent = true }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', builtin.find_files, options)
    vim.keymap.set('n', '<leader>g', builtin.live_grep, options)
    -- vim.keymap.set('n', keys.search_cursor, builtin.grep_string, option)
    -- vim.keymap.set('n', keys.find_buffer, builtin.buffers, option)
  end,
}
