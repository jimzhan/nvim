return {
  {
    lazy = false,
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",   -- optional
    },
    config = function()
      require("neo-tree").setup({
        window ={
          ["o"] = "noop",
        },
        buffers = {
          ["o"] = "noop",
        },
        git_status = {
          ["o"] = "noop",
        },
      })
      -- Global toggle: Ctrl+O (overrides Vim's jump‑list back)
      vim.keymap.set("n", "<C-o>", ":Neotree toggle<CR>", { noremap = true, silent = true })
    end,
  },
}
