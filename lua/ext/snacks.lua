return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
    },
  },
  keys = {
    -- Search file only under current working directory.
    { "<C-p>", function() Snacks.picker.files() end, desc = "Find Files" },
    -- Search file under context.
    { "<C-s>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
  },
}
