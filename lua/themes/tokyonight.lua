return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  config = function ()
    -- Available theme: tokyonight-night | tokyonight-moon | tokyonight-storm
    vim.cmd[[colorscheme tokyonight-moon]]
  end
}
