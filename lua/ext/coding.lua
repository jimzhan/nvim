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
    local zero = require('lsp-zero')

    zero.on_attach(function(client, buffer)
      zero.default_keymaps({buffer = buffer})
    end)

    zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['tsserver'] = { 'javascript', 'typescript' },
        ['pyright'] = { 'python' }
      }
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'eslint',
        'html',
        'marksman',
        'tsserver',
        'pyright'
      },
      handlers = { zero.default_setup }
    })
  end
}
