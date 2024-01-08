return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- Autocomplete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
  },

  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'eslint',
        'kotlin_language_server',
        'tsserver',
        'pyright'
      },
      handlers = { lsp_zero.default_setup }
    })
  end
}