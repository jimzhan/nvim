return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup({
      highlights = {
        Normal = {
          link = 'Normal',
        },
        NormalFloat = {
          link = 'Normal',
        },
        FloatBorder = {
          link = 'FloatBorder',
        },
        SignColumn = {
          link = 'EndOfBuffer',
        },
        EndOfBuffer = {
          link = 'EndOfBuffer',
        },
      },
      persist_size = true,
      persist_mode = true,
      autochdir = true,
    })
    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm size=20 direction=horizontal<cr>')
  end
}
