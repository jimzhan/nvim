return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      indent = {
        enable = true,
        disable = {},
      },
      ensure_installed = {
        'lua',
        'java',
        'javascript',
        'markdown',
        'markdown_inline',
        'regex'
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })

    -- let it to use 'markdown' parser for mdx filetype.
    vim.treesitter.language.register('markdown', 'mdx')
  end,
}
